//
//  MenuInteractorInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol MenuInteractorInput: AnyObject {
    var output: MenuInteractorOutput? { get set }
    func getMenu() async throws -> [CoffeeModel]
}
