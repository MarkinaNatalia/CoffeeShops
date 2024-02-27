//
//  MenuModuleBuilder.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class MenuModuleBuilder {
    static func build(locationId: Int) -> MenuViewController {
        let view = MenuViewController()
        let router = MenuRouter()
        let interactor = MenuInteractor(locationId: locationId)
        let presenter = MenuPresenter(view: view,
                                      router: router,
                                      interactor: interactor)
        interactor.output = presenter
        view.output = presenter
        router.viewController = view
        return view
    }
}
