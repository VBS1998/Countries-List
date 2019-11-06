import UIKit

protocol CountriesListInteractorDelegate : AnyObject{
    func didOrderCountries()
    func didReloadCountries()
}

final class CountriesListInteractor{
    
    enum Segmented: Int, CaseIterable {
        case names = 0
        case hdi

        var stringValue: String {
            switch self {
            case .names:
                return "Names"
            case .hdi:
                return "HDI"
            }
        }
    }
    
    weak var delegate: CountriesListInteractorDelegate?
    var countries: [Country] = []
    let dataFlow: CountriesListDataFlowProtocol
    
    var presenter : CountriesListPresenter?
    
    init(countries: [Country] = [], dataFlow: CountriesListDataFlowProtocol) {
        self.countries = CountriesProvider.provide(10) //Mock
        self.dataFlow = dataFlow
        
    }
    
    func orderCountries(accordingTo segmentedIndex: Int) {
        guard let segmented = Segmented(rawValue: segmentedIndex) else {
            return
        }
        if segmented == .names {
            countries = countries.sorted{ $0.name < $1.name }
        } else {
            countries = countries.sorted{ $0.hdi > $1.hdi }
        }
        delegate?.didOrderCountries()
    }

    func segmentedNames() -> [String] {
        return Segmented.allCases.map { $0.stringValue }
    }

    func descriptionFor(country: Country, segmentedIndex: Int) -> String {
        guard let segmented = Segmented(rawValue: segmentedIndex) else {
            return ""
        }
        return segmented == .names ? country.name : String(country.hdi)
    }

    func reloadCountries(segmentedIndex : Int) {
        presenter?.present(countries, countries.map({self.descriptionFor(country: $0, segmentedIndex: segmentedIndex)}))
        delegate?.didReloadCountries()
    }

    func selectCountry(at row: Int) {
        dataFlow.selectedCountry = countries[row]
    }
}

