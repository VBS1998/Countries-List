// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// TODO: Remove this Sourcery mark above
import UIKit

protocol CountriesListViewControllerDelegate: AnyObject {

}

final class CountriesListViewController: UIViewController {

    var coordinator : CountriesListCoordinator = CountriesListCoordinator()
    var interactor : CountriesListInteractor!

    var viewModels : [CountriesListViewModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        //TODO: DATAFLOW
        interactor = CountriesListInteractor(dataFlow: CountriesListDataFlow())
        interactor.presenter = CountriesListPresenter()
        interactor.presenter?.viewController = self
        
        interactor.presenter?.delegate = self
        interactor.delegate = interactor.presenter
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        reloadCountries()
    }
    
    func reloadCountries(){
        interactor.reloadCountries(segmentedIndex: segControl.selectedSegmentIndex)
    }
    
    
    @IBAction func order(_ sender: Any) {
        interactor.orderCountries(accordingTo: segControl.selectedSegmentIndex)
    }
    
}

extension CountriesListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesListCell") as! CountriesListTableViewCell
        cell.render(viewModel: viewModels[indexPath.row])
        return cell
    }
}

extension CountriesListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 83
    }
}

extension CountriesListViewController : CountriesListPresenterDelegate{
    func didOrderCountries() {
        //
    }
    
    func didReloadCountries() {
        tableView.reloadData()
    }
    
    
}
