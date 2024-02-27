//
//  PaymentViewInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol PaymentViewInput: AnyObject {
    var output: PaymentViewOutput? { get set }
    func loadedOrder(order: [OrderItemModel])
}
