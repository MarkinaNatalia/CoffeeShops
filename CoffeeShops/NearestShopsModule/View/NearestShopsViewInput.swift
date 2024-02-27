//
//  NearestShopsViewInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol NearestShopsViewInput: AnyObject {
    var output: NearestShopsViewOutput? { get set }
    func loadedLocations(locations: [LocationModel])
}
