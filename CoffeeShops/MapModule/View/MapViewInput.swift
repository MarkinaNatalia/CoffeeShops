//
//  MapViewInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol MapViewInput: AnyObject {
    var output: MapViewOutput? { get set }
    func loadedLocations(locations: [LocationModel])
}
