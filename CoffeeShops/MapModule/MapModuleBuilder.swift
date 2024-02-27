//
//  MapModuleBuilder.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class MapModuleBuilder {
    static func build(locations: [LocationModel]) -> MapViewController {
        let view = MapViewController()
        let router = MapRouter()
        let interactor = MapInteractor(locations: locations)
        let presenter = MapPresenter(view: view,
                                     router: router,
                                     interactor: interactor)
        interactor.output = presenter
        view.output = presenter
        router.viewController = view
        return view
    }
}
