//
//  RegistrationViewInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol RegistrationViewInput: AnyObject {
    var output: RegistrationViewOutput? { get set }
    func showAlertError(message: String)
}
