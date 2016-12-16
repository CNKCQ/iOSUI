//
//  RunningLineViewController.swift
//  Maplocation
//
//  Created by KingCQ on 2016/12/16.
//  Copyright © 2016年 KingCQ. All rights reserved.
//  模拟跑步轨迹

class RunningLineViewController: UIViewController, MAMapViewDelegate, AMapLocationManagerDelegate {
    
    // MARK: - Properties
    let showSegment = UISegmentedControl(items: ["Start", "Stop"])
    let pointAnnotation = MAPointAnnotation()
    
    var mapView: MAMapView!
    lazy var locationManager = AMapLocationManager()
    var colors: Array<UIColor>!
    var line: MAMultiPolyline!
    
    // MARK: - Action Handle
    func configLocationManager() {
        locationManager.delegate = self
        
        locationManager.pausesLocationUpdatesAutomatically = false
        
        locationManager.allowsBackgroundLocationUpdates = true
        
        mapView.showsUserLocation = true
        mapView.customizeUserLocationAccuracyCircleRepresentation = true
        mapView.userTrackingMode = MAUserTrackingMode.follow
    }
    
    func showSegmentAction(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            
            locationManager.stopUpdatingLocation()
            
            mapView.removeAnnotation(pointAnnotation)
        } else {
            mapView.addAnnotation(pointAnnotation)
            
            locationManager.startUpdatingLocation()
        }
    }
    
    // MARK: - AMapLocationManagerDelegate
    func amapLocationManager(_ manager: AMapLocationManager!, didFailWithError error: Error!) {
        let error = error as NSError
        print("didFailWithError:{\(error.code) - \(error.localizedDescription)};")
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!, reGeocode: AMapLocationReGeocode?) {
        print("location:{lat:\(location.coordinate.latitude); lon:\(location.coordinate.longitude); accuracy:\(location.horizontalAccuracy); reGeocode:\(reGeocode?.formattedAddress)};")
        
        pointAnnotation.coordinate = location.coordinate
        mapView.centerCoordinate = location.coordinate
        mapView.setZoomLevel(15.1, animated: false)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        initToolBar()
        initMapView()
        configLocationManager()
        initLine()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mapView.addAnnotation(pointAnnotation)
        locationManager.startUpdatingLocation()
        mapView.add(line)
        mapView.showOverlays([line], edgePadding: UIEdgeInsetsMake(20, 20, 20, 20), animated: false)
    }
    
    func initMapView() {
        mapView = MAMapView(frame: view.bounds)
        mapView.delegate = self
        
        view.addSubview(mapView)
    }
    
    func initToolBar() {
        let flexble = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        showSegment.addTarget(self, action: #selector(showSegmentAction(sender:)), for: .valueChanged)
        showSegment.selectedSegmentIndex = 0
        
        setToolbarItems([flexble, UIBarButtonItem(customView: showSegment), flexble], animated: false)
    }
    
    
    // MARK: - MAMapVie Delegate
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation is MAPointAnnotation {
            let pointReuseIndetifier = "pointReuseIndetifier"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: pointReuseIndetifier) as? MAPinAnnotationView
            
            if annotationView == nil {
                annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: pointReuseIndetifier)
            }
            
            annotationView?.canShowCallout = false
            annotationView?.animatesDrop = false
            annotationView?.isDraggable = false
            annotationView?.image = UIImage(named: "icon_location.png")
            return annotationView
        }
        
        return nil
    }
    
    func initLine() {
        colors = Array()
        var arr:Array<Int> = Array.init()
        let buffer = UnsafeMutablePointer<CLLocationCoordinate2D>.allocate(capacity: 1)
        let i = 1
        colors.append(self.colorFromSpeed(speed: 10.0))
        arr.append(i)
        line = MAMultiPolyline.init(coordinates: buffer, count: UInt(i), drawStyleIndexes:arr)
        buffer.deallocate(capacity: i)
    }
    
    func colorFromSpeed(speed: Double) -> UIColor {
        let lowSpeedTh = 2.0
        let highSpeedTh = 3.5
        let warmHue = 0.02 //偏暖色
        let coldHue = 0.4 //偏冷色
        
        let hue = coldHue - (speed - lowSpeedTh)*(coldHue - warmHue)/(highSpeedTh - lowSpeedTh)
        return UIColor.init(hue: CGFloat(hue), saturation: 1, brightness: 1, alpha: 1)
    }
    
    // MARK: - MAMapViewDelegate
    func mapView(_ mapView: MAMapView!, rendererFor overlay: MAOverlay!) -> MAOverlayRenderer! {
        
        if (overlay.isKind(of: MAMultiPolyline.self))
        {
            let renderer = MAMultiColoredPolylineRenderer.init(multiPolyline: overlay as! MAMultiPolyline!)
            
            renderer?.lineWidth = 8.0
            renderer?.strokeColors = colors
            renderer?.isGradient = true
            return renderer;
        }
        
        return nil;
    }

    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
//        let i = line.pointCount + 1
//        let buffer = UnsafeMutablePointer<CLLocationCoordinate2D>.allocate(capacity: Int(i))
//        buffer[Int(i)].latitude =  userLocation.coordinate.latitude
//        buffer[Int(i)].longitude = userLocation.coordinate.longitude
//        line = MAMultiPolyline.init(coordinates: buffer, count: UInt(i))
//        buffer.deallocate(capacity: Int(i))
    }
}
