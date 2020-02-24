//
//  MainCoordinator.swift
//  RxTestProject
//
//  Created by Olusegun Solaja on 2020-02-21.
//  Copyright © 2020 Olusegun Solaja. All rights reserved.
//

import Foundation
import XCoordinator

enum AppRoute: Route{
    case first
    case second
}

class MainCoordinator:TabBarCoordinator<AppRoute> {
    
    private let firstPageRouter: StrongRouter<TodayForecastRoute>
    private let secondPageRouter: StrongRouter<ShortTermForecastRoute>

    convenience init () {
        let firstPageCoordinator = TodayForecastCoordinator()
        firstPageCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        let secondPageCoordinator = ShortTermForcastCoordinator()
        secondPageCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        

        self.init(firstPageRouter: firstPageCoordinator.strongRouter, secondRouter:secondPageCoordinator.strongRouter)

    }

    init(firstPageRouter: StrongRouter<TodayForecastRoute>, secondRouter:StrongRouter<ShortTermForecastRoute>) {
        self.firstPageRouter = firstPageRouter
        self.secondPageRouter = secondRouter
        
        super.init(tabs: [firstPageRouter,secondPageRouter], select: firstPageRouter)
    }
    
    
 
    override func prepareTransition(for route:AppRoute) -> TabBarTransition {
           switch route {
           case .first:
             return .select(firstPageRouter)
           case .second:
              return .select(secondPageRouter)
        }
    }
}
