//
//  MapRouter.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class MapRouter: MapRouterInput {
    weak var viewController: MapViewController?
    
    func openMenuModule(locationId: Int) {
        let vc = MenuModuleBuilder.build(locationId: locationId)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
