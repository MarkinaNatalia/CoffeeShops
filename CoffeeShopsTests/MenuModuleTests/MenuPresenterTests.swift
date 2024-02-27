//
//  MenuPresenterTests.swift
//  CoffeeShopsTests
//
//  Created by Наталья on 25.02.2024.
//

import XCTest
@testable import CoffeeShops

final class MenuPresenterTests: XCTestCase {
    let mockView = MockMenuViewController()
    let mockRouter = MockMenuRouter()
    let interactor = MenuInteractor(locationId: 0)
    
    var presenter: MenuPresenter!

    override func setUpWithError() throws {
        presenter = MenuPresenter(view: mockView,
                                  router: mockRouter,
                                  interactor: interactor)
    }

    override func tearDownWithError() throws {
        
    }
    
    func testLoadData() {
        // Given
        
        // When
        Task {
            await presenter.loadData()
            
            // Then
            XCTAssertTrue(mockView.loadedMenuCalled)
        }
    }
    
    func testOpenPaymentModule() {
        // Given
        
        // When
        presenter.openPaymentModule(order: [])
        
        //Then
        XCTAssertTrue(mockRouter.openPaymentModuleCalled)
    }
}
