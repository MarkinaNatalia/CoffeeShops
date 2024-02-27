//
//  MenuRouter.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class MenuRouter: MenuRouterInput {
    weak var viewController: MenuViewController?
    
    func openPaymentModule(order: [OrderItemModel]) {
        let vc = PaymentModuleBuilder.build(order: order)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
