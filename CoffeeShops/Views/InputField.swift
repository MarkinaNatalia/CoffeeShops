//
//  InputField.swift
//  CoffeeShops
//
//  Created by Наталья on 08.02.2024.
//

import UIKit
import SnapKit

final class InputField: UITextField {
    private let textPadding = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textPadding)
    }
    
    private func setupSettings() {
        layer.cornerRadius = 24.5
        layer.borderColor = UIColor(named: "CoyoteBrown")?.cgColor
        layer.borderWidth = 2
        layer.masksToBounds = true
        textColor = UIColor(named: "PaleTaupe")
        font = .systemFont(ofSize: 18, weight: .regular)
        
        snp.makeConstraints {
            $0.height.equalTo(47)
        }
    }
}
