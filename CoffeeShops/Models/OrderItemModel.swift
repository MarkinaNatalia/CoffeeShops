//
//  OrderItemModel.swift
//  CoffeeShops
//
//  Created by Наталья on 13.02.2024.
//

struct OrderItemModel {
    var id: Int
    var name: String
    var price: Int
    private(set) var count: Int
    
    mutating func updateCount(_ count: Int) {
        self.count = count
    }
}
