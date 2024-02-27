//
//  MockNearestShopsViewController.swift
//  CoffeeShops
//
//  Created by Наталья on 25.02.2024.
//

final class MockNearestShopsViewController: NearestShopsViewInput {
    var output: NearestShopsViewOutput?
    var loadedLocationsCalled = false
    
    func loadedLocations(locations: [LocationModel]) {
        loadedLocationsCalled = true
    }
}
