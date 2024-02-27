//
//  MenuViewInput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol MenuViewInput: AnyObject {
    var output: MenuViewOutput? { get set }
    func loadedMenu(menu: [CoffeeModel])
}
