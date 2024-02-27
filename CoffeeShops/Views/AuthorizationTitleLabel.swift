//
//  AuthorizationTitleLabel.swift
//  CoffeeShops
//
//  Created by Наталья on 08.02.2024.
//

import UIKit

final class AuthorizationTitleLabel: UILabel {
    let title: String
    
    init(title: String) {
        self.title = title
        
        super.init(frame: .zero)
        setupSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSettings() {
        textColor = UIColor(named: "CoyoteBrown")
        font = .systemFont(ofSize: 15, weight: .regular)
        text = title
    }
}
