//
//  TableViewCell.swift
//  CoffeeShops
//
//  Created by Наталья on 13.02.2024.
//

import UIKit
import SnapKit

protocol TableCellDelegate {
    func updateCount(_ count: Int, tagCell: Int)
}

final class TableViewCell : UITableViewCell {
    var delegateCell: TableCellDelegate?
    
    private var count = 0 {
        didSet { countText.text = "\(count)" }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "CoyoteBrown")
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "PaleTaupe")
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "MinusIconDark"), for: .normal)
        button.addTarget(self, action: #selector(minusAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PlusIconDark"), for: .normal)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 16))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        descriptionLabel.text = ""
        count = 0
    }
    
    func updateData(title: String, description: String, isShowCount: Bool = false) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    func addCountLabel(count: Int) {
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .medium)
        self.count = count

        contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.left.equalTo(titleLabel.snp.right)
            $0.right.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setupSettings() {
        contentView.backgroundColor = UIColor(named: "Champagne")
        contentView.layer.cornerRadius = 5
        
        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 2
        
        selectionStyle = .none
        
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    private func addConstraints() {
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(10)
            $0.right.equalToSuperview().inset(86)
            $0.top.equalToSuperview().inset(14)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(10)
            $0.right.equalToSuperview().inset(86)
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
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
