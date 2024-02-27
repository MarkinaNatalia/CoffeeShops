//
//  NearestShopsModuleBuilder.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

final class NearestShopsModuleBuilder {
    static func build() -> NearestShopsViewController {
        let view = NearestShopsViewController()
        let router = NearestShopsRouter()
        let interactor = NearestShopsInteractor()
        let presenter = NearestShopsPresenter(view: view,
                                              router: router,
                                              interactor: interactor)
        interactor.output = presenter
        view.output = presenter
        router.viewController = view
        return view
    }
}
