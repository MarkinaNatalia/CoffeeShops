//
//  MockNearestShopsRouter.swift
//  CoffeeShops
//
//  Created by Наталья on 25.02.2024.
//

final class MockNearestShopsRouter: NearestShopsRouterInput {
    weak var viewController: NearestShopsViewController?
    var openMapModuleCalled = false
    var openMenuModuleCalled = false
    
    func openMapModule(locations: [LocationModel]) {
        openMapModuleCalled = true
    }
    
    func openMenuModule(locationId: Int) {
        openMenuModuleCalled = true
    }
}
