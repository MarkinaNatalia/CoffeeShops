//
//  RegistrationModuleBuilder.swift
//  CoffeeShops
//
//  Created by Наталья on 07.02.2024.
//

final class RegistrationModuleBuilder {
    static func build() -> RegistrationViewController {
        let view = RegistrationViewController()
        let router = RegistrationRouter()
        let interactor = RegistrationInteractor()
        let presenter = RegistrationPresenter(view: view,
                                               router: router,
                                               interactor: interactor)
        interactor.output = presenter
        view.output = presenter
        router.viewController = view
        return view
    }
}
