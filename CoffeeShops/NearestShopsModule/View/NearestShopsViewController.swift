//
//  NearestShopsViewController.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

import UIKit
import SnapKit
import CoreLocation

final class NearestShopsViewController: UIViewController {
    var output: NearestShopsViewOutput?
    
    private let locationManager = CLLocationManager()
    private var locations: [LocationModel] = []
    private var currentLocation: CLLocation?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "shopCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderTopPadding = 0
        tableView.sectionHeaderHeight = 6
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 10, right: 0)
        return tableView
    }()
    
    private lazy var mapButton = CustomButton(title: "На карте")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Ближайшие кофейни"
        
        setNavigationBackButton()
        addSubviews()
        setupLocationManager()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addConstraints()
        output?.loadData()
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(mapButton)
        
        mapButton.addTarget(self, action: #selector(openMapModule), for: .touchUpInside)
    }
    
    private func addConstraints() {
        tableView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        mapButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(19)
            $0.right.equalToSuperview().inset(18)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc private func openMapModule() {
        output?.openMapModule()
    }
    
    private func setupLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        
        DispatchQueue.global().async { [weak self] in
            guard CLLocationManager.locationServicesEnabled(),
                  let self = self else { return }
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager.startUpdatingLocation()
        }
    }
    
    private func getDistance(currentShop: LocationModel) -> Double {
        let currentShopLat = Double(currentShop.point.latitude) ?? 0
        let currentShopLon = Double(currentShop.point.longitude) ?? 0
        
        let currentShopLocation = CLLocation(latitude: currentShopLat, longitude: currentShopLon)
        let distance = currentLocation?.distance(from: currentShopLocation) ?? 0
        return distance
    }
}

extension NearestShopsViewController: NearestShopsViewInput {
    func loadedLocations(locations: [LocationModel]) {
        self.locations = locations
        tableView.reloadData()
    }
}

extension NearestShopsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shopCell",
                                                       for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        guard locations.indices.contains(indexPath.section) else { return UITableViewCell() }
        let currentShopItem = locations[indexPath.section]
        let distance = getDistance(currentShop: currentShopItem)
        cell.updateData(title: currentShopItem.name,
                        description: "\(String(format: "%.0f", distance)) км от вас")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension NearestShopsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let locationId = locations[indexPath.section].id
        output?.openMenuModule(locationId: locationId)
    }
}

extension NearestShopsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = manager.location
    }
}
