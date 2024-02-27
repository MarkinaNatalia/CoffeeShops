//
//  PaymentViewController.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

import UIKit
import SnapKit

final class PaymentViewController: UIViewController {
    var output: PaymentViewOutput?
    
    private var order: [OrderItemModel] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "paymentCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderTopPadding = 0
        tableView.sectionHeaderHeight = 6
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 10, right: 0)
        return tableView
    }()
    
    private lazy var successfulOrderLabel: UILabel = {
        let label = UILabel()
        label.text = "Время ожидания заказа\n15 минут!\nСпасибо, что выбрали нас!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = UIColor(named: "CoyoteBrown")
        return label
    }()
    
    private lazy var payButton = CustomButton(title: "Оплатить")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Ваш заказ"
        
        addSubviews()
        setNavigationBackButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addConstraints()
        output?.loadData()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(payButton)
        view.addSubview(successfulOrderLabel)
    }
    
    private func addConstraints() {
        tableView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(330)
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        payButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(19)
            $0.right.equalToSuperview().inset(18)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        successfulOrderLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(159 + 48)
            $0.horizontalEdges.equalToSuperview().inset(13)
        }
    }
}

extension PaymentViewController: PaymentViewInput {
    func loadedOrder(order: [OrderItemModel]) {
        self.order = order
        tableView.reloadData()
    }
}

extension PaymentViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return order.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell",
                                                       for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        guard order.indices.contains(indexPath.section) else { return UITableViewCell() }
        let currentOrderItem = order[indexPath.section]
        let price = "\(currentOrderItem.price) руб"
        cell.updateData(title: currentOrderItem.name, description: price)
        cell.addCountLabel(count: currentOrderItem.count)
        cell.delegateCell = self
        cell.tag = currentOrderItem.id
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension PaymentViewController: UITableViewDelegate {
    
}

extension PaymentViewController: TableCellDelegate {
    func updateCount(_ count: Int, tagCell: Int) {
        guard let index = (order.firstIndex { $0.id == tagCell }) else { return }
        order[index].updateCount(count)
    }
}
