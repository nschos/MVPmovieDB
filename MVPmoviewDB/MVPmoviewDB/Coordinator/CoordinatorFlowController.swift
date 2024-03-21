//
//  CoordinatorFlowController.swift
//  MVPmoviewDB
//
//  Created by Luana Tais Thomas on 21/03/24.
//

import Foundation
import UIKit

class CoordinatorFlowController {
    private var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> UIViewController {
        let listViewController = ListViewController()
        listViewController.presenter.coordinator = self
        self.navigationController = UINavigationController(rootViewController: listViewController)
        return navigationController
    }
}

extension CoordinatorFlowController {
    func goToDetail(indexPath: IndexPath) {
        let movieDetailViewController = MovieDetailViewController(indexPath: indexPath)
        movieDetailViewController.coordinator = self
        navigationController.pushViewController(movieDetailViewController , animated: true)
    }
}
