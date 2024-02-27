//
//  MenuViewOutput.swift
//  CoffeeShops
//
//  Created by Наталья on 24.02.2024.
//

import UIKit

protocol MenuViewOutput: AnyObject {
    func loadData()
    func openPaymentModule(order: [OrderItemModel])
    func loadImage(imageUrl: String, closure: @escaping (UIImage) -> Void)
}
