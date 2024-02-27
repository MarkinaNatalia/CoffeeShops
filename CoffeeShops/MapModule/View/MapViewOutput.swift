//
//  MapViewOutput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

protocol MapViewOutput: AnyObject {
    func loadData()
    func openMenuModule(locationId: Int)
}
