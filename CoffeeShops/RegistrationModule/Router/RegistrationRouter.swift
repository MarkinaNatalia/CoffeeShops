//
//  RegistrationRouter.swift
//  CoffeeShops
//
//  Created by Наталья on 07.02.2024.
//

final class RegistrationRouter: RegistrationRouterInput {
    weak var viewController: RegistrationViewController?
    
    func openLoginModule() {
        let vc = AuthorizationModuleBuilder.build()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openAuthorizationModule() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
