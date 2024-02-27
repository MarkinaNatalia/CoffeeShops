//
//  AuthorizationType.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

enum AuthorizationType {
    case registration
    case authorization
    
    var url: String {
        switch self {
        case .registration:
            return "auth/register"
        case .authorization:
            return "auth/login"
        }
    }
}
