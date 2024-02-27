//
//  AuthorizationInteractorInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol AuthorizationInteractorInput: AnyObject {
    var output: AuthorizationInteractorOutput? { get set }
    func authorization(login: String, password: String) async throws
}
