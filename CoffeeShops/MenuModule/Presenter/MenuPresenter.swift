//
//  MenuPresenter.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

import UIKit

final class MenuPresenter {
    private let view: MenuViewInput
    private let router: MenuRouterInput
    private let interactor: MenuInteractorInput
    
    init(view: MenuViewInput, router: MenuRouterInput, interactor: MenuInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension MenuPresenter: MenuViewOutput {
    @MainActor
    func loadData() {
        Task {
            do {
                view.loadedMenu(menu: try await interactor.getMenu())
            } catch {
                
            }
        }
    }
    
    func openPaymentModule(order: [OrderItemModel]) {
        router.openPaymentModule(order: order)
    }
}

extension MenuPresenter: MenuInteractorOutput {
    
}
