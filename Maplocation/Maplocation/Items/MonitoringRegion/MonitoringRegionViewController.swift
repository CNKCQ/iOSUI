//
//  MonitoringRegionViewController.swift
//  Maplocation
//
//  Created by KingCQ on 2016/12/15.
//  Copyright © 2016年 KingCQ. All rights reserved.
//  地理围栏

class MonitoringRegionViewController: BaseController, MAMapViewDelegate, AMapLocationManagerDelegate {
    
    //MARK: - Properties
    
    var regions = Array<AMapLocationCircleRegion>()
    
    var mapView: MAMapView!
    lazy var locationManager = AMapLocationManager()
    
    //MARK: - Action Handle
    
    func configLocationManager() {
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        locationManager.pausesLocationUpdatesAutomatically = false
        
        locationManager.allowsBackgroundLocationUpdates = true
    }
    
    //MARK: - Add Regions
    
    func getCurrentLocation() {
        locationManager .requestLocation(withReGeocode: true) { [weak self] (location: CLLocation?, regeocode: AMapLocationReGeocode?, error: Error?) in
            if let location = location {
                self?.addCircleReionForCoordinate(coordinate: location.coordinate)
            }
        }
    }
    
    func addCircleReionForCoordinate(coordinate: CLLocationCoordinate2D) {
        
        let cirRegion200 = AMapLocationCircleRegion(center: coordinate, radius: 200.0, identifier: "circleRegion200")
        let cirRegion300 = AMapLocationCircleRegion(center: coordinate, radius: 300.0, identifier: "circleRegion300")
        
        locationManager.startMonitoring(for: cirRegion200)
        locationManager.startMonitoring(for: cirRegion300)
        
        regions.append(cirRegion200!)
        regions.append(cirRegion300!)
        
        let circle200 = MACircle(center: coordinate, radius: 200.0)
        let circle300 = MACircle(center: coordinate, radius: 300.0)
        mapView.add(circle200)
        mapView.add(circle300)
        
        mapView.setVisibleMapRect(circle300!.boundingMapRect, animated: false)
    }
    
    //MARK: - AMapLocationManagerDelegate
    
    func amapLocationManager(_ manager: AMapLocationManager!, didFailWithError error: Error!) {
        let error = error as NSError
        NSLog("didFailWithError:{\(error.code) - \(error.localizedDescription)};")
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didStartMonitoringFor region: AMapLocationRegion!) {
        NSLog("didStartMonitoringForRegion:%@", region)
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, monitoringDidFailFor region: AMapLocationRegion!, withError error: Error!) {
        NSLog("monitoringDidFailForRegion:%@", error.localizedDescription)
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didEnter region: AMapLocationRegion!) {
        NSLog("didEnterRegion:%@", region)
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didExitRegion region: AMapLocationRegion!) {
        NSLog("didEnterRegion:%@", region)
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didDetermineState state: AMapLocationRegionState, for region: AMapLocationRegion!) {
        NSLog("didDetermineState:%@; state:%d", region, state.rawValue)
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        initMapView()
        
        configLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getCurrentLocation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        for aRegion in regions {
            locationManager.stopMonitoring(for: aRegion)
        }
    }
    
    func initMapView() {
        mapView = MAMapView(frame: view.bounds)
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        view.addSubview(mapView)
    }
    
    //MARK: - MAMapViewDelegate
    
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        if overlay is MAPolygon {
            let polylineRenderer: MAPolygonRenderer = MAPolygonRenderer(overlay: overlay)
            polylineRenderer.lineWidth = 5.0
            polylineRenderer.strokeColor = UIColor.red
            
            return polylineRenderer
        }
        else if overlay is MACircle {
            let circleRenderer: MACircleRenderer = MACircleRenderer(overlay: overlay)
            circleRenderer.lineWidth = 5.0
            circleRenderer.strokeColor = UIColor.blue
            
            return circleRenderer
        }
        return nil
    }
    
}
