//
//  MapInteractor.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class MapInteractor: MapInteractorInput {
    weak var output: MapInteractorOutput?
    let locations: [LocationModel]
    
    init(locations: [LocationModel]) {
        self.locations = locations
    }
    
    func getLocations() -> [LocationModel] {
        return locations
    }
}
