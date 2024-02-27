//
//  PaymentPresenter.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class PaymentPresenter {
    private let view: PaymentViewInput
    private let router: PaymentRouterInput
    private let interactor: PaymentInteractorInput
    
    init(view: PaymentViewInput, router: PaymentRouterInput, interactor: PaymentInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension PaymentPresenter: PaymentViewOutput {
    func loadData() {
        view.loadedOrder(order: interactor.getOrder())
    }
}

extension PaymentPresenter: PaymentInteractorOutput {
    
}
