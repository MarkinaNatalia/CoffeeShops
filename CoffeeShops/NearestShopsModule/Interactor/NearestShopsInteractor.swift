//
//  NearestShopsInteractor.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class NearestShopsInteractor: NearestShopsInteractorInput {
    weak var output: NearestShopsInteractorOutput?
    
    let networkService = NetworkService.shared
    var locations: [LocationModel] = []
    
    func getLocations() async throws -> [LocationModel] {
        let locations = try await networkService.getLocations()
        self.locations = locations
        return locations
    }
    
    func getSavingLocations() -> [LocationModel] {
        return locations
    }
}
