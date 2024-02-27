//
//  CustomButton.swift
//  CoffeeShops
//
//  Created by Наталья on 09.02.2024.
//

import UIKit
import SnapKit

final class CustomButton: UIButton {
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
        backgroundColor = UIColor(named: "ButtonBackground")
        layer.cornerRadius = 24.5
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.withAlphaComponent(0.15).cgColor
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
        let attributedText = NSAttributedString(string: title,
                                                attributes: [
                                                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
                                                    NSAttributedString.Key.foregroundColor: UIColor(named: "Champagne")
                                                ]
        )
        setAttributedTitle(attributedText, for: .normal)
        
        snp.makeConstraints {
            $0.height.equalTo(47)
        }
    }
}
