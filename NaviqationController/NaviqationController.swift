//
//  NaviqationController.swift
//  Jobiz
//
//  Created by Developer on 24.06.24.
//


import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createTabbar()
    }
    
    func createTabbar(){
        let vcFirst = UINavigationController(rootViewController: HomeViewController())
        let vcSecond = UINavigationController(rootViewController: MessagesViewController())
        let vcThird = UINavigationController(rootViewController:  SavedViewController())
        let vcFourth = UINavigationController(rootViewController: NotificationViewController())
        
        
        
        
        vcFirst.tabBarItem.image = UIImage(named: "home")
        vcSecond.tabBarItem.image =  UIImage(named: "messages")
        vcThird.tabBarItem.image =  UIImage(named: "saved")
        vcFourth.tabBarItem.image =  UIImage(named: "notification")
        
        
        setViewControllers([vcFirst, vcSecond, vcThird, vcFourth],animated: true)
        
    }
    
}
