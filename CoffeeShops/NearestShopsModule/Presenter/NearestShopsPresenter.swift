//
//  NearestShopsPresenter.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class NearestShopsPresenter {
    private let view: NearestShopsViewInput
    private let router: NearestShopsRouterInput
    private let interactor: NearestShopsInteractorInput
    
    init(view: NearestShopsViewInput, router: NearestShopsRouterInput, interactor: NearestShopsInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension NearestShopsPresenter: NearestShopsViewOutput {
    @MainActor
    func loadData() {
        Task {
            do {
                let locations = try await interactor.getLocations()
                view.loadedLocations(locations: locations)
            } catch {
                
            }
        }
    }
    
    func openMapModule() {
        let locations = interactor.getSavingLocations()
        router.openMapModule(locations: locations)
    }
    
    func openMenuModule(locationId: Int) {
        router.openMenuModule(locationId: locationId)
    }
}

extension NearestShopsPresenter: NearestShopsInteractorOutput {
    
}
