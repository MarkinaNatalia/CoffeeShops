//
//  ClickableLabel.swift
//  CoffeeShops
//
//  Created by Наталья on 14.02.2024.
//

import UIKit

protocol ClickableLabelDelegate {
    func tappedOnLabel()
}

final class ClickableLabel: UILabel {
    var delegate: ClickableLabelDelegate?
    
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
        textColor = UIColor(named: "PaleTaupe")
        font = .systemFont(ofSize: 15, weight: .regular)
        text = title
        
        isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel))
        tapgesture.numberOfTapsRequired = 1
        addGestureRecognizer(tapgesture)
    }
    
    @objc private func tappedOnLabel() {
        delegate?.tappedOnLabel()
    }
}
