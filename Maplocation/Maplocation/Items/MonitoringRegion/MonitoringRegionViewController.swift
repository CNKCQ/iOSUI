//
//  MonitoringRegionViewController.swift
//  Maplocation
//
//  Created by KingCQ on 2016/12/15.
//  Copyright © 2016年 KingCQ. All rights reserved.
//  地理围栏

class MonitoringRegionViewController: BaseController, MAMapViewDelegate, AMapLocationManagerDelegate {
    
    // MARK: - Properties
    var regions = Array<AMapLocationCircleRegion>()
    
    var mapView: MAMapView!
    lazy var locationManager = AMapLocationManager()
    
    // MARK: - Action Handle
    func configLocationManager() {
        locationManager.delegate = self
        // 设定定位精度。默认为 kCLLocationAccuracyBest
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        // 指定定位是否会被系统自动暂停。默认为YES
        locationManager.pausesLocationUpdatesAutomatically = false
        // 是否允许后台定位。默认为NO。只在iOS 9.0及之后起作用
        locationManager.allowsBackgroundLocationUpdates = true
    }
    
    // MARK: - Add Regions
    func getCurrentLocation() {
        locationManager.requestLocation(withReGeocode: true) { [weak self] (location: CLLocation?, regeocode: AMapLocationReGeocode?, error: Error?) in
            if let location = location {
                self?.addCircleReionForCoordinate(coordinate: location.coordinate)
            }
        }
    }
    
    // 添加地理围栏
    func addCircleReionForCoordinate(coordinate: CLLocationCoordinate2D) {
        // AMapLocationCircleRegion类，定义一个圆形范围
        let cirRegion200 = AMapLocationCircleRegion(center: coordinate, radius: 200.0, identifier: "circleRegion200")
        let cirRegion300 = AMapLocationCircleRegion(center: coordinate, radius: 300.0, identifier: "circleRegion300")
        // 开始监控指定的region
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
    
    // MARK: - AMapLocationManagerDelegate
    // 当定位发生错误时，会调用代理的此方法。
    func amapLocationManager(_ manager: AMapLocationManager!, didFailWithError error: Error!) {
        let error = error as NSError
        print("didFailWithError:{\(error.code) - \(error.localizedDescription)};")
    }
    
    // 开始监控region回调函数
    func amapLocationManager(_ manager: AMapLocationManager!, didStartMonitoringFor region: AMapLocationRegion!) {
        print("didStartMonitoringForRegion:%@", region)
    }
    
    // 监控region失败回调函数
    func amapLocationManager(_ manager: AMapLocationManager!, monitoringDidFailFor region: AMapLocationRegion!, withError error: Error!) {
        print("monitoringDidFailForRegion:%@", error.localizedDescription)
    }
    
    // 进入region回调函数
    func amapLocationManager(_ manager: AMapLocationManager!, didEnter region: AMapLocationRegion!) {
        print("didEnterRegion:%@", region)
    }
    
    // 离开region回调函数
    func amapLocationManager(_ manager: AMapLocationManager!, didExitRegion region: AMapLocationRegion!) {
        print("didEnterRegion:%@", region)
    }
    
    // 查询region状态回调函数
    func amapLocationManager(_ manager: AMapLocationManager!, didDetermineState state: AMapLocationRegionState, for region: AMapLocationRegion!) {
        print("didDetermineState:%@; state:%d", region, state.rawValue)
    }
    
    // MARK: - Life Cycle
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
    
    // MARK: - MAMapViewDelegate
    // 根据指定的overlay生成对应覆盖物Renderer
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        if overlay is MAPolygon {
            let polylineRenderer: MAPolygonRenderer = MAPolygonRenderer(overlay: overlay)
            polylineRenderer.lineWidth = 1.0
            polylineRenderer.strokeColor = UIColor.red
            
            return polylineRenderer
        }
        else if overlay is MACircle {
            let circleRenderer: MACircleRenderer = MACircleRenderer(overlay: overlay)
            circleRenderer.lineWidth = 1.0
            circleRenderer.strokeColor = UIColor.blue
            
            return circleRenderer
        }
        return nil
    }
    
}
