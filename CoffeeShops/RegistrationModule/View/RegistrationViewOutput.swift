//
//  RegistrationViewOutput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol RegistrationViewOutput: AnyObject {
    func registration(login: String, password: String, repeatPassword: String)
    func openAuthorizationModule()
}
