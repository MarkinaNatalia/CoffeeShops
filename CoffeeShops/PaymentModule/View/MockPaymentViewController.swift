//
//  MockPaymentViewController.swift
//  CoffeeShops
//
//  Created by Наталья on 26.02.2024.
//

final class MockPaymentViewController: PaymentViewInput {
    var output: PaymentViewOutput?
    var loadedOrderCalled = false
    
    func loadedOrder(order: [OrderItemModel]) {
        loadedOrderCalled = true
    }
}
