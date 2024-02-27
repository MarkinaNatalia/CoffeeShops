//
//  RegistrationPresenter.swift
//  CoffeeShops
//
//  Created by Наталья on 07.02.2024.
//

final class RegistrationPresenter {
    private let view: RegistrationViewInput
    private let router: RegistrationRouterInput
    private let interactor: RegistrationInteractorInput
    
    init(view: RegistrationViewInput, router: RegistrationRouterInput, interactor: RegistrationInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension RegistrationPresenter: RegistrationViewOutput {
    @MainActor
    func registration(login: String, password: String, repeatPassword: String) {
        guard !login.isEmpty else {
            view.showAlertError(message: "Введите ваш e-mail")
            return
        }
        guard !password.isEmpty else {
            view.showAlertError(message: "Введите пароль")
            return
        }
        guard !repeatPassword.isEmpty else {
            view.showAlertError(message: "Повторите пароль")
            return
        }
        guard password == repeatPassword else {
            view.showAlertError(message: "Ваши пароли не совпадают")
            return
        }
        
        Task {
            do {
                try await interactor.registration(login: login, password: password)
                router.openLoginModule()
            } catch {
                view.showAlertError(message: "Ошибка при регистрации!\nПопробуйте еще раз")
            }
        }
    }
    
    func openAuthorizationModule() {
        router.openAuthorizationModule()
    }
}

extension RegistrationPresenter: RegistrationInteractorOutput {
    
}
