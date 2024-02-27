//
//  AuthorizationRouter.swift
//  CoffeeShops
//
//  Created by Наталья on 09.02.2024.
//

final class AuthorizationRouter: AuthorizationRouterInput {
    weak var viewController: AuthorizationViewController?
    
    func openNearestShopsModule() {
        let vc = NearestShopsModuleBuilder.build()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openRegistrationModule() {
        let vc = RegistrationModuleBuilder.build()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
