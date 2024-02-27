//
//  MockMenuViewController.swift
//  CoffeeShops
//
//  Created by Наталья on 25.02.2024.
//

final class MockMenuViewController: MenuViewInput {
    var output: MenuViewOutput?
    var loadedMenuCalled = false
    
    func loadedMenu(menu: [CoffeeModel]) {
        loadedMenuCalled = true
    }
}
