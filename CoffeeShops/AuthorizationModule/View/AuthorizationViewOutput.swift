//
//  AuthorizationViewOutput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol AuthorizationViewOutput: AnyObject {
    func authorization(login: String, password: String)
    func openRegistrationModule()
}
