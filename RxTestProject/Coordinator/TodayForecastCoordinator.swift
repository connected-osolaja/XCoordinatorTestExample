//
//  FirstPageCoordinator.swift
//  RxTestProject
//
//  Created by Olusegun Solaja on 2020-02-21.
//  Copyright © 2020 Olusegun Solaja. All rights reserved.
//

import Foundation
import XCoordinator

enum TodayForecastRoute: Route {
    case pageOne
    case presentedPage
    case pushDetailPage
    case presentNewController
}

class TodayForecastCoordinator: NavigationCoordinator<TodayForecastRoute> {
    var presentValue = false
    
    init() {
        super.init(initialRoute: .pageOne)
    }
    
    override func prepareTransition(for route:TodayForecastRoute) -> NavigationTransition {
        switch route {
        case .pageOne:
            let viewModel = TodayForecastViewModel(router: unownedRouter)
            let controller = TodayForecastViewController(viewModel)
            return .push(controller)
            
        case .presentedPage:
            let alert  = UIAlertController(title: "Alert", message: "message", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            presentValue = true
            return .present(alert)
            
        case .pushDetailPage:
            
            let detailViewModel = DetailViewModel(router: unownedRouter)
            let detailViewController = DetailViewController(detailViewModel)
            
            return .push(detailViewController)
            
        case .presentNewController:
            let shortTermCoordinator = ShortTermForcastCoordinator()
            return .present(shortTermCoordinator.strongRouter)
            
        }
    }
}
