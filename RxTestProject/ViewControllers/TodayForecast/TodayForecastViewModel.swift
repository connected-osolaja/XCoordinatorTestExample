//
//  TodayForecastViewModel.swift
//  RxTestProject
//
//  Created by Olusegun Solaja on 2020-02-21.
//  Copyright © 2020 Olusegun Solaja. All rights reserved.
//

import Foundation
import XCoordinator
import RxSwift
import RxCocoa

class TodayForecastViewModel {
    
    // MARK: Stored properties
    private let router: UnownedRouter<TodayForecastRoute>
    
    // MARK: Action
    lazy var presentTrigger = AnyObserver<Void>{ [weak self] _ in
        self?.router.trigger(.presentedPage)
    }
    
    lazy var showDetailView = AnyObserver<Void> { _ in
        self.router.trigger(.pushDetailPage)
    }
    
    // MARK: Initialization
    init(router: UnownedRouter<TodayForecastRoute>) {
        self.router = router
    }
    
}

