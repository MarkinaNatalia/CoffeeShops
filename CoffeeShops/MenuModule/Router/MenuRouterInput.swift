//
//  MenuRouterInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol MenuRouterInput: AnyObject {
    func openPaymentModule(order: [OrderItemModel])
}
