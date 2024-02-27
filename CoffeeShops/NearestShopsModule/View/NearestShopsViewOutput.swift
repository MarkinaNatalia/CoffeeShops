//
//  NearestShopsViewOutput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol NearestShopsViewOutput: AnyObject {
    func loadData()
    func openMapModule()
    func openMenuModule(locationId: Int)
}
