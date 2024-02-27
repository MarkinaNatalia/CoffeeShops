//
//  CoffeeCell.swift
//  CoffeeShops
//
//  Created by Наталья on 13.02.2024.
//

import UIKit
import SnapKit

protocol CoffeeCellDelegate {
    func updateCount(_ count: Int, tagCell: Int)
}

final class CoffeeCell: UICollectionViewCell {
    var delegateCell: CoffeeCellDelegate?
    
    private var count = 0 {
        didSet { countText.text = "\(count)" }
    }
    
    private lazy var imageCoffee: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private lazy var nameCoffee: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PaleTaupe")
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var priceCoffee: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "CoyoteBrown")
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "MinusIcon"), for: .normal)
        button.addTarget(self, action: #selector(minusAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PlusIcon"), for: .normal)
        button.addTarget(self, action: #selector(plusAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var countText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "CoyoteBrown")
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "\(count)"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 9
        
        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(countText)
        stackView.addArrangedSubview(plusButton)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameCoffee.text = ""
        priceCoffee.text = ""
        count = 0
        imageCoffee.image = nil
    }
    
    func updateCoffeeModel(_ coffee: CoffeeModel) {
        nameCoffee.text = coffee.name
        priceCoffee.text = "\(coffee.price) руб"
    }
    
    func updateImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.imageCoffee.image = image
        }
    }
    
    private func setupSettings() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
        
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(imageCoffee)
        contentView.addSubview(nameCoffee)
        contentView.addSubview(priceCoffee)
        contentView.addSubview(stackView)
    }
    
    private func addConstraints() {
        imageCoffee.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.height.equalTo(137)
        }
        
        nameCoffee.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(11)
            $0.top.equalTo(imageCoffee.snp.bottom).offset(10)
        }
        
        priceCoffee.snp.makeConstraints {
            $0.left.equalToSuperview().inset(11)
            $0.top.equalTo(nameCoffee.snp.bottom).offset(12)
        }
        
        stackView.snp.makeConstraints {
            $0.right.equalToSuperview().inset(5)
            $0.left.equalTo(priceCoffee.snp.right).offset(3)
            $0.top.equalTo(nameCoffee.snp.bottom).offset(9)
        }
    }
    
    @objc private func minusAction() {
        count = count > 0 ? count - 1 : 0
        delegateCell?.updateCount(count, tagCell: tag)
    }
    
    @objc private func plusAction() {
        count += 1
        delegateCell?.updateCount(count, tagCell: tag)
    }
}
