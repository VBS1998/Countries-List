// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// TODO: Remove this Sourcery mark above
import UIKit

protocol CountriesListViewControllerDelegate: AnyObject {

}

final class CountriesListViewController: UIViewController {

    var coordinator : CountriesListCoordinator = CountriesListCoordinator()
    var interactor : CountriesListInteractor!
    
    override func viewDidLoad() {
        interactor = CountriesListInteractor()
        interactor.presenter = CountriesListPresenter()
        interactor.presenter?.viewController = self
    }

}
