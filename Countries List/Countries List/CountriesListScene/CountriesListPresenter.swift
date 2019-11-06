// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// TODO: Remove this Sourcery mark above
import UIKit

protocol CountriesListPresenterDelegate {
    func didReloadCountries()
    func didOrderCountries()
}

final class CountriesListPresenter{

    weak var viewController : CountriesListViewController?
    
    //weak var delegate : CountriesListPresenterDelegate?
    
    var numberOfCountries: Int {
        return viewController?.interactor?.countries.count ?? 0
    }
    
    func present(_ countries : [Country], segmented: Int){
        var viewModels : [CountriesListViewModel] = []
        for country in countries{
            viewModels.append(CountriesListViewModel(imageName: country.name, description: descriptionFor(country: country, segmented: segmented)))
        }
        
        viewController?.viewModels = viewModels
        //delegate?.didReloadCountries()
        //TODO: DELEGATE
        viewController?.tableView.reloadData()
    }
    
    func descriptionFor(country: Country, segmented: Int) -> String {
        
        return segmented == 0 ? country.name : String(country.hdi)
    }

}

extension CountriesListPresenter: CountriesListInteractorDelegate {
    func didReloadCountries() {
        //self.delegate?.didReloadCountries()
    }
    
    func didOrderCountries() {
        //gdag
    }
    
}
