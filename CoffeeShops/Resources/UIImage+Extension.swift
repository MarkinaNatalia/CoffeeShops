//
//  UIImage+Extension.swift
//  CoffeeShops
//
//  Created by Наталья on 28.02.2024.
//

import UIKit

extension UIImageView {
    func loadImage(imageUrl: String) async {
        return await withCheckedContinuation { continuation in
            guard let url = URL(string: imageUrl),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else { return }
            self.image = image
            continuation.resume()
        }
    }
}
