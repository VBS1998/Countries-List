// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// TODO: Remove this Sourcery mark above
import UIKit

protocol CountriesListPresenterDelegate : AnyObject{
    func didReloadCountries()
    func didOrderCountries()
}

final class CountriesListPresenter{

    weak var viewController : CountriesListViewController?
    
    weak var delegate : CountriesListPresenterDelegate?
    
    var numberOfCountries: Int {
        return viewController?.interactor?.countries.count ?? 0
    }
    
    func present(_ countries : [Country],_ descriptions : [String]){
        var viewModels : [CountriesListViewModel] = []
        for (row,country) in countries.enumerated(){
            viewModels.append(CountriesListViewModel(imageName: country.name, description: descriptions[row]))
        }
        
        viewController?.viewModels = viewModels
        delegate?.didReloadCountries()
    }

}

extension CountriesListPresenter: CountriesListInteractorDelegate {
    func didReloadCountries() {
        self.delegate?.didReloadCountries()
    }
    
    func didOrderCountries() {
        viewController?.reloadCountries()
        self.delegate?.didOrderCountries()
    }
    
}
