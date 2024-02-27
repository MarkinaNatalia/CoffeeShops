//
//  AuthorizationInteractor.swift
//  CoffeeShops
//
//  Created by Наталья on 09.02.2024.
//

final class AuthorizationInteractor: AuthorizationInteractorInput {
    weak var output: AuthorizationInteractorOutput?
    
    let networkService = NetworkService.shared
    
    func authorization(login: String, password: String) async throws {
        try await networkService.authorization(login: login, password: password, type: .authorization)
    }
}
