//
//  MockMenuRouter.swift
//  CoffeeShops
//
//  Created by Наталья on 25.02.2024.
//

final class MockMenuRouter: MenuRouterInput {
    weak var viewController: MenuViewController?
    var openPaymentModuleCalled = false
    
    func openPaymentModule(order: [OrderItemModel]) {
        openPaymentModuleCalled = true
    }
}
