//
//  YMapView.swift
//  CoffeeShops
//
//  Created by Наталья on 12.02.2024.
//

import UIKit
import YandexMapsMobile

final class YMapView: UIView {
    var mapView: YMKMapView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSettings()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func moveToLocation(latitude: String, longitude: String) {
        let lat = Double(latitude) ?? 0
        let lon = Double(longitude) ?? 0
        
        mapView.mapWindow.map.move(with: YMKCameraPosition(target: YMKPoint(latitude: lat, longitude: lon),
                                                           zoom: 14,
                                                           azimuth: 0,
                                                           tilt: 0))
    }

    private func setupSettings() {
        mapView = YMKMapView(frame: bounds, vulkanPreferred: YMapView.isM1Simulator())
        mapView.mapWindow.map.mapType = .map
        mapView.mapWindow.map.isRotateGesturesEnabled = false
        
//        let scale = UIScreen.main.scale
//        let mapKit = YMKMapKit.sharedInstance()
//        let userLocationLayer = mapKit.createUserLocationLayer(with: mapView.mapWindow)
//        userLocationLayer.setVisibleWithOn(true)
//        userLocationLayer.isHeadingEnabled = true
//        userLocationLayer.setAnchorWithAnchorNormal(
//            CGPoint(x: 0.5 * mapView.frame.size.width * scale, y: 0.5 * mapView.frame.size.height * scale),
//            anchorCourse: CGPoint(x: 0.5 * mapView.frame.size.width * scale, y: 0.83 * mapView.frame.size.height * scale))
//        userLocationLayer.setObjectListenerWith(self)
    }

    static func isM1Simulator() -> Bool {
        return (TARGET_IPHONE_SIMULATOR & TARGET_CPU_ARM64) != 0
    }
}
