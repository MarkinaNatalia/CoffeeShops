//
//  RegistrationInteractorInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol RegistrationInteractorInput: AnyObject {
    var output: RegistrationInteractorOutput? { get set }
    func registration(login: String, password: String) async throws
}
