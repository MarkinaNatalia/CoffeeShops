//
//  MenuViewController.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

import UIKit
import SnapKit

final class MenuViewController: UIViewController {
    var output: MenuViewOutput?
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 13
        flowLayout.minimumInteritemSpacing = 13
        
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.register(CoffeeCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var paymentButton = CustomButton(title: "Перейти к оплате")
    
    private var images: [UIImage] = []
    private var menu: [CoffeeModel] = []
    private var order: [Int: Int] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Меню"
        
        setNavigationBackButton()
        addSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addConstraints()
        output?.loadData()
    }
    
    private func addSubviews() {
        view.addSubview(collectionView)
        view.addSubview(paymentButton)
        
        paymentButton.addTarget(self, action: #selector(openPaymentModule), for: .touchUpInside)
    }
    
    private func addConstraints() {
        collectionView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        paymentButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(19)
            $0.right.equalToSuperview().inset(18)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc private func openPaymentModule() {
        var orderItems: [OrderItemModel] = []
        
        for item in order {
            guard let orderItem = (menu.first { $0.id == item.key }) else { return }
            
            let newItem = OrderItemModel(id: orderItem.id, 
                                         name: orderItem.name,
                                         price: orderItem.price,
                                         count: item.value)
            orderItems.append(newItem)
        }
        output?.openPaymentModule(order: orderItems)
    }
}

extension MenuViewController: MenuViewInput {
    func loadedMenu(menu: [CoffeeModel]) {
        self.menu = menu
        collectionView.reloadData()
    }
}

extension MenuViewController: UICollectionViewDelegate {
    
}

extension MenuViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId",
                                                            for: indexPath) as? CoffeeCell else { return UICollectionViewCell() }
        if menu.indices.contains(indexPath.row) {
            cell.updateCoffeeModel(menu[indexPath.row])
            cell.tag = menu[indexPath.row].id
        }
        
        cell.delegateCell = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 16, bottom: 10, right: 16)
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsInRow: CGFloat = 2
        let paddingSpace = 16 * 2 + 13
        let availableWidth = view.frame.width - CGFloat(paddingSpace)
        let widthItem = availableWidth / itemsInRow
        
        return CGSize(width: widthItem, height: 205)
    }
}

extension MenuViewController: CoffeeCellDelegate {
    func updateCount(_ count: Int, tagCell: Int) {
        order.updateValue(count, forKey: tagCell)
    }
}
