//
//  NetworkServiceProtocol.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol NetworkServiceProtocol {
    func authorization(login: String, password: String, type: AuthorizationType) async throws
    func getLocations() async throws -> [LocationModel]
    func getMenu(id: Int) async throws -> [CoffeeModel]
}
