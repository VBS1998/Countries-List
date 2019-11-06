//
//  CountriesListCoordinator.swift
//  Countries List
//
//  Created by Gustavo Vilas Boas on 04/11/19.
//  Copyright © 2019 Gustavo Vilas Boas. All rights reserved.
//

import Foundation
import UIKit

class CountriesListCoordinator{
    
    static func make() -> CountriesListViewController?{
        
        let viewController = UIStoryboard.viewController(of: CountriesListViewController.self, storyboardId: .countriesList)
        
        
        let coordinator = CountriesListCoordinator()
        viewController?.coordinator = coordinator

        return viewController
    }
    
}
