//
//  TabBarController.swift
//  UIScrollView-Demo
//
//  Created by Seb Vidal on 15/07/2023.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: - init(nibName:bundle:)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupViewControllers()
    }
    
    // MARK: - init?(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViewControllers() {
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: "First", image: .add, tag: 0)
        
        viewControllers = [navigationController]
    }
}
