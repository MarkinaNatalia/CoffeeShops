//
//  AuthBody.swift
//  CoffeeShops
//
//  Created by Наталья on 09.02.2024.
//

struct AuthorizationBody: Codable {
    let login: String
    let password: String
}
