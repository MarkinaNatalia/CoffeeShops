//
//  NearestShopsInteractorTests.swift
//  CoffeeShopsTests
//
//  Created by Наталья on 27.02.2024.
//

import XCTest
@testable import CoffeeShops

final class NearestShopsInteractorTests: XCTestCase {
    let interactor = NearestShopsInteractor()

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testGetLocations() {
        Task {
            let locations = try await interactor.getLocations()
            XCTAssertNoThrow(locations)
        }
    }
}
