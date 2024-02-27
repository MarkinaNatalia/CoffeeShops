//
//  NearestShopsRouter.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class NearestShopsRouter: NearestShopsRouterInput {
    weak var viewController: NearestShopsViewController?
    
    func openMapModule(locations: [LocationModel]) {
        let vc = MapModuleBuilder.build(locations: locations)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openMenuModule(locationId: Int) {
        let vc = MenuModuleBuilder.build(locationId: locationId)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
