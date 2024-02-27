//
//  PaymentModuleBuilder.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class PaymentModuleBuilder {
    static func build(order: [OrderItemModel]) -> PaymentViewController {
        let view = PaymentViewController()
        let router = PaymentRouter()
        let interactor = PaymentInteractor(order: order)
        let presenter = PaymentPresenter(view: view,
                                         router: router,
                                         interactor: interactor)
        interactor.output = presenter
        view.output = presenter
        router.viewController = view
        return view
    }
}
