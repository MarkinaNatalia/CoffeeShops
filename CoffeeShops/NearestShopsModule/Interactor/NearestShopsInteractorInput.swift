//
//  NearestShopsInteractorInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol NearestShopsInteractorInput: AnyObject {
    var output: NearestShopsInteractorOutput? { get set }
    func getLocations() async throws -> [LocationModel]
    func getSavingLocations() -> [LocationModel]
}
