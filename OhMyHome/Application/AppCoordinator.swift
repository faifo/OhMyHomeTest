//
//  AppCoordinator.swift
//  OhMyHome
//
//  Created by Solo on 01/04/2022.
//

import UIKit
final class AppCoordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
        let searchViewController = SearchViewController()
        let searchFactory = SearchFactory()
        searchFactory.configure(searchViewController: searchViewController)
        navigationController = UINavigationController(rootViewController: searchViewController)
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
