//
//  RegistrationInteractor.swift
//  CoffeeShops
//
//  Created by Наталья on 07.02.2024.
//

final class RegistrationInteractor: RegistrationInteractorInput {
    weak var output: RegistrationInteractorOutput?
    
    let networkService = NetworkService.shared
    
    func registration(login: String, password: String) async throws {
        try await networkService.authorization(login: login, password: password, type: .registration)
    }
}
