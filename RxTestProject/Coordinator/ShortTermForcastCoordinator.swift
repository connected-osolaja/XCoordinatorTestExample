//
//  SecondCoordinator.swift
//  RxTestProject
//
//  Created by Olusegun Solaja on 2020-02-21.
//  Copyright © 2020 Olusegun Solaja. All rights reserved.
//

import Foundation
import XCoordinator

enum ShortTermForecastRoute: Route {
    case pageOne
    case pageTwo
}

class ShortTermForcastCoordinator: PageCoordinator<ShortTermForecastRoute> {
    
    private var firstPage: ShortTermForecastViewController
    private var secondPage: ShortTermForecastViewController
    
    init() {
        firstPage = ShortTermForecastViewController()
        secondPage = ShortTermForecastViewController()
        secondPage.view.backgroundColor = .green
        
        super.init(
            rootViewController: .init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil),
            pages: [firstPage, secondPage])
    }
    
    override func prepareTransition(for route:ShortTermForecastRoute) -> PageTransition {
        switch route {
        case .pageOne:
            return .set(firstPage, direction: .forward)
            
        case .pageTwo:
            return .set(secondPage, direction: .reverse)
            
        }
    }
}
