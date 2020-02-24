//
//  AppDelegate.swift
//  RxTestProject
//
//  Created by Olusegun Solaja on 2020-02-21.
//  Copyright © 2020 Olusegun Solaja. All rights reserved.
//

import UIKit
import XCoordinator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private lazy var mainWindow = UIWindow()
    private let  mainRouter = MainCoordinator().strongRouter
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        mainRouter.setRoot(for: mainWindow)
        
        return true
    }
    

}

