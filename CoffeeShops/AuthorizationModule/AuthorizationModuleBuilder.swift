//
//  AuthorizationModuleBuilder.swift
//  CoffeeShops
//
//  Created by Наталья on 09.02.2024.
//

final class AuthorizationModuleBuilder {
    static func build() -> AuthorizationViewController {
        let view = AuthorizationViewController()
        let router = AuthorizationRouter()
        let interactor = AuthorizationInteractor()
        let presenter = AuthorizationPresenter(view: view,
                                               router: router,
                                               interactor: interactor)
        interactor.output = presenter
        view.output = presenter
        router.viewController = view
        return view
    }
}
