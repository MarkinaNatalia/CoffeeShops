//
//  PaymentPresenterTests.swift
//  CoffeeShopsTests
//
//  Created by Наталья on 26.02.2024.
//

import XCTest
@testable import CoffeeShops

final class PaymentPresenterTests: XCTestCase {
    let mockView = MockPaymentViewController()
    let router = PaymentRouter()
    let interactor = PaymentInteractor(order: [])
    
    var presenter: PaymentPresenter!

    override func setUpWithError() throws {
        presenter = PaymentPresenter(view: mockView,
                                     router: router,
                                     interactor: interactor)
    }

    override func tearDownWithError() throws {
        
    }

    func testLoadData() {
        // Given
        
        // When
        Task {
            presenter.loadData()
            
            // Then
            XCTAssertTrue(mockView.loadedOrderCalled)
        }
    }
}
