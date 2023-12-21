//
//  PATabBarController.swift
//  petApp
//
//  Created by Talha Demirkan on 21.12.2023.
//

import UIKit

class PATabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemOrange
        viewControllers = [createCalendarNC(), createHomeNC(),createStorageNC()]
    }
    
    func createCalendarNC() -> UINavigationController {
        let calendarVC = PACalendarViewController()
        calendarVC.title = "Calendar"
        calendarVC.tabBarItem = UITabBarItem(title: "Calendar",
                                             image: UIImage(systemName: "calendar"),
                                             tag: 0)
        
        return UINavigationController(rootViewController: calendarVC)
    }
    
    
    func createHomeNC() -> UINavigationController {
        let homeVC = PAHomeViewController()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(title: "Home",
                                             image: UIImage(systemName: "house"),
                                             tag: 1)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
    
    func createStorageNC() -> UINavigationController {
        let storageVC = PAStorageViewController()
        storageVC.title = "Storage"
        storageVC.tabBarItem = UITabBarItem(title: "Storage",
                                             image: UIImage(systemName: "square.and.arrow.down"),
                                             tag: 0)
        
        return UINavigationController(rootViewController: storageVC)
    }
    

    
    
}
