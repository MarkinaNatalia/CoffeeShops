//
//  MapInteractorInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol MapInteractorInput: AnyObject {
    var output: MapInteractorOutput? { get set }
    func getLocations() -> [LocationModel]
}
