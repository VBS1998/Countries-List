// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// TODO: Remove this Sourcery mark above
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
        self.countries = countries
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

//    func descriptionFor(row: Int, segmentedIndex: Int) -> String {
//        guard let segmented = Segmented(rawValue: segmentedIndex) else {
//            return ""
//        }
//        return segmented == .names ? countries[row].name : String(countries[row].hdi)
//    }

    func reloadCountries(segmented : Int) {
        countries = CountriesProvider.provide(10)
        //TODO: Segmented com .names
        presenter?.present(countries, segmented: segmented)
        delegate?.didReloadCountries()
    }

    func selectCountry(at row: Int) {
        dataFlow.selectedCountry = countries[row]
    }
}

