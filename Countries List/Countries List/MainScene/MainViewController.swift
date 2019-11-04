// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// TODO: Remove this Sourcery mark above
import UIKit

protocol MainViewControllerDelegate: AnyObject {
    
}

final class MainViewController: UIViewController {
    
    var coordinator : MainCoordinator = MainCoordinator()
    
    var interactor : MainInteractor!
    
    override func viewDidLoad() {
        interactor = MainInteractor()
        interactor.presenter = MainPresenter()
        interactor.presenter?.viewController = self
    }
    
}
