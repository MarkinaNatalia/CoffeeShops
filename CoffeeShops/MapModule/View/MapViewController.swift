//
//  MapViewController.swift
//  CoffeeShops
//
//  Created by Наталья on 11.02.2024.
//

import UIKit
import SnapKit
import YandexMapsMobile

final class MapViewController: UIViewController {
    var output: MapViewOutput?
    
    private var mapView: YMapView!
    private var locations: [LocationModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Карта"
        
        setNavigationBackButton()
        addSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addConstraints()
        output?.loadData()
    }
    
    private func addSubviews() {
        mapView = YMapView(frame: view.frame)
        view.addSubview(mapView.mapView)
    }
    
    private func addConstraints() {
        mapView.mapView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func addPlacemarks() {
        let image = UIImage(named: "PlacemarkIcon") ?? UIImage()
        
        for location in locations {
            guard let lat = Double(location.point.latitude),
                  let lon = Double(location.point.longitude)
            else { return }
            
            let placemark = mapView.mapView.mapWindow.map.mapObjects.addPlacemark()
            placemark.geometry = YMKPoint(latitude: lat, longitude: lon)
            placemark.setIconWith(image)
            placemark.setTextWithText(
                location.name,
                style: YMKTextStyle(
                    size: 14,
                    color: UIColor(named: "CoyoteBrown"),
                    outlineColor: .white,
                    placement: .bottom,
                    offset: 0,
                    offsetFromIcon: true,
                    textOptional: false
                )
            )
            placemark.addTapListener(with: self)
        }
    }
}

extension MapViewController: MapViewInput {
    func loadedLocations(locations: [LocationModel]) {
        self.locations = locations
        mapView.moveToLocation(latitude: locations[0].point.latitude, longitude: locations[0].point.longitude)
        addPlacemarks()
    }
}

extension MapViewController: YMKMapObjectTapListener {
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        guard let placemark = mapObject as? YMKPlacemarkMapObject,
              let locationId = locations.first(where: { Double($0.point.latitude) == placemark.geometry.latitude && Double($0.point.longitude) == placemark.geometry.longitude })?.id else { return false }
        
        output?.openMenuModule(locationId: locationId)
        return true
    }
}
