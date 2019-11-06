//
//  MainRouter.swift
//  
//
//  Created by Gustavo Vilas Boas on 03/11/19.
//

import Foundation
import UIKit


class MainCoordinator{
    
    static func make() -> MainViewController?{
        
        let viewController = UIStoryboard.viewController(of: MainViewController.self, storyboardId: .main)
        
        let coordinator = MainCoordinator()
        viewController?.coordinator = coordinator

        return viewController
    }
    
    func presentListCountriesScene(from navigation: UINavigationController){
        
        guard let nextViewController = CountriesListCoordinator.make() else {
            return
        }
        navigation.pushViewController(nextViewController, animated: true)
    }
}
