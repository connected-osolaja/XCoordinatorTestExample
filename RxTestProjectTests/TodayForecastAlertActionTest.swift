//
//  TodayForecastAlertActionTest.swift
//  RxTestProjectTests
//
//  Created by Olusegun Solaja on 2020-02-24.
//  Copyright © 2020 Olusegun Solaja. All rights reserved.
//

import XCTest
import RxSwift
import XCoordinator
@testable import RxTestProject

class TodayForecastAlertActionTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testButtonTappedPresentsAlert() {
        // Given
        let coordinator = MockTodayForecastCoordinator()
        let viewModel = TodayForecastViewModel(router: coordinator.unownedRouter)
        
        // When
        viewModel.presentTrigger.onNext(())
            
        // Then
        XCTAssert(coordinator.presentedPageClicked == true)
    }

}

class MockTodayForecastCoordinator: NavigationCoordinator<TodayForecastRoute> {
    var pageOneClicked = false
    var presentedPageClicked = false
    
    init() {
        super.init(initialRoute: .pageOne)
    }
    
    override func prepareTransition(for route:TodayForecastRoute) -> NavigationTransition {
        switch route {
        case .pageOne:
            
            pageOneClicked = true
            return .none()
            
        case .presentedPage:
            
            presentedPageClicked = true
            return .none()
        }
    }
}
