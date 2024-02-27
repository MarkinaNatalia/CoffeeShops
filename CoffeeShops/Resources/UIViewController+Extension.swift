//
//  UIViewController+Extension.swift
//  CoffeeShops
//
//  Created by Наталья on 14.02.2024.
//

import UIKit

extension UIViewController {
    func createNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "NavBarBackground")
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "CoyoteBrown"),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    func setNavigationBackButton() {
        navigationItem.setHidesBackButton(true, animated:false)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        button.setImage(UIImage(named: "ArrowBack"), for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        view.addSubview(button)
        
        let leftBarButtonItem = UIBarButtonItem(customView: view ?? UIView())
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc private func backAction() {
        navigationController?.popViewController(animated: true)
    }
}
