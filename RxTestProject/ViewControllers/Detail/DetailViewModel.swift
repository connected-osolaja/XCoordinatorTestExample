//
//  DetailViewModel.swift
//  RxTestProject
//
//  Created by Olusegun Solaja on 2020-02-24.
//  Copyright © 2020 Olusegun Solaja. All rights reserved.
//

import Foundation
import XCoordinator
import RxSwift

class DetailViewModel {
    
    // MARK: Stored properties
    private let router: UnownedRouter<TodayForecastRoute>
    
    // MARK: Action
    lazy var presentNewController = AnyObserver<Void> { [weak self] _ in
        self?.router.trigger(.presentNewController)
    }
    
    // MARK: Initialization
    init(router: UnownedRouter<TodayForecastRoute>) {
        self.router = router
    }
    
}
