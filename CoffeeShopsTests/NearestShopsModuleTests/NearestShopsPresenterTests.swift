//
//  NearestShopsPresenterTests.swift
//  CoffeeShopsTests
//
//  Created by Наталья on 25.02.2024.
//

import XCTest
@testable import CoffeeShops

final class NearestShopsPresenterTests: XCTestCase {
    let mockView = MockNearestShopsViewController()
    let mockRouter = MockNearestShopsRouter()
    let interactor = NearestShopsInteractor()
    
    var presenter: NearestShopsPresenter!

    override func setUpWithError() throws {
        presenter = NearestShopsPresenter(view: mockView,
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
            XCTAssertTrue(mockView.loadedLocationsCalled)
        }
    }
    
    func testOpenMapModule() {
        // Given
        
        // When
        presenter.openMapModule()
        
        // Then
        XCTAssertTrue(mockRouter.openMapModuleCalled)
    }
    
    func testOpenMenuModule() {
        // Given
        
        // When
        presenter.openMenuModule(locationId: 0)
        
        // Then
        XCTAssertTrue(mockRouter.openMenuModuleCalled)
    }
}
