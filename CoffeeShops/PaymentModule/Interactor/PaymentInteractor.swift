//
//  PaymentInteractor.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class PaymentInteractor: PaymentInteractorInput {
    weak var output: PaymentInteractorOutput?
    var order: [OrderItemModel]
    
    init(order: [OrderItemModel]) {
        self.order = order
    }
    
    func getOrder() -> [OrderItemModel] {
        return order
    }
}
