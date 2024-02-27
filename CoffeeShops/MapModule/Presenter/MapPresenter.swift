//
//  MapPresenter.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class MapPresenter {
    private let view: MapViewInput
    private let router: MapRouterInput
    private let interactor: MapInteractorInput
    
    init(view: MapViewInput, router: MapRouterInput, interactor: MapInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension MapPresenter: MapViewOutput {
    func loadData() {
        view.loadedLocations(locations: interactor.getLocations())
    }
    
    func openMenuModule(locationId: Int) {
        router.openMenuModule(locationId: locationId)
    }
}

extension MapPresenter: MapInteractorOutput {
    
}
