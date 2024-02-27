//
//  MenuInteractor.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class MenuInteractor: MenuInteractorInput {
    weak var output: MenuInteractorOutput?
    var locationId: Int
    
    let networkService = NetworkService.shared
    
    init(locationId: Int) {
        self.locationId = locationId
    }
    
    func getMenu() async throws -> [CoffeeModel] {
        return try await networkService.getMenu(id: locationId)
    }
}
