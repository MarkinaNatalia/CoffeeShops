//
//  AuthorizationPresenter.swift
//  CoffeeShops
//
//  Created by Наталья on 09.02.2024.
//

final class AuthorizationPresenter {
    private let view: AuthorizationViewInput
    private let router: AuthorizationRouterInput
    private let interactor: AuthorizationInteractorInput
    
    init(view: AuthorizationViewInput, router: AuthorizationRouterInput, interactor: AuthorizationInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension AuthorizationPresenter: AuthorizationViewOutput {
    @MainActor
    func authorization(login: String, password: String) {
        guard !login.isEmpty else {
            view.showAlertError(message: "Введите ваш e-mail")
            return
        }
        guard !password.isEmpty else {
            view.showAlertError(message: "Введите пароль")
            return
        }
        
        Task {
            do {
                try await interactor.authorization(login: login, password: password)
                router.openNearestShopsModule()
            } catch {
                view.showAlertError(message: "Ошибка при входе!\nПопробуйте еще раз")
            }
        }
    }
    
    func openRegistrationModule() {
        router.openRegistrationModule()
    }
}

extension AuthorizationPresenter: AuthorizationInteractorOutput {
    
}
