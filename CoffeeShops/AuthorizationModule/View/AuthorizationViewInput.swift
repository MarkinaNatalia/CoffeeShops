//
//  AuthorizationViewInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol AuthorizationViewInput: AnyObject {
    var output: AuthorizationViewOutput? { get set }
    func showAlertError(message: String)
}
