//
//  PaymentInteractorInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol PaymentInteractorInput: AnyObject {
    var output: PaymentInteractorOutput? { get set }
    func getOrder() -> [OrderItemModel]
}
