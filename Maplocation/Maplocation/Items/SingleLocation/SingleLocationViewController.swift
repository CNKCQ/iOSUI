//
//  SingleLocationViewController.swift
//  Maplocation
//
//  Created by KingCQ on 2016/12/15.
//  Copyright © 2016年 KingCQ. All rights reserved.
//  单次定位地图展示

class SingleLocationViewController: BaseController, MAMapViewDelegate, AMapLocationManagerDelegate {
    let defaultLocationTimeout = 6
    let defaultReGeocodeTimeout = 3

    var mapView: MAMapView!
    var completionBlock: AMapLocatingCompletionBlock!
    lazy var locationManager = AMapLocationManager()

    func configLocationManager() {
        locationManager.delegate = self

        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters

        locationManager.pausesLocationUpdatesAutomatically = false

        locationManager.allowsBackgroundLocationUpdates = true
        // 指定单次定位超时时间,默认为10s。最小值是2s。注意单次定位请求前设置。
        locationManager.locationTimeout = defaultLocationTimeout
        // 指定单次定位逆地理超时时间,默认为5s。最小值是2s。注意单次定位请求前设置。
        locationManager.reGeocodeTimeout = defaultReGeocodeTimeout
    }

    func cleanUpAction() {
        locationManager.stopUpdatingLocation()

        locationManager.delegate = nil

        mapView.removeAnnotations(mapView.annotations)
    }

    func reGeocodeAction() {
        mapView.removeAnnotations(mapView.annotations)

        locationManager.requestLocation(withReGeocode: true, completionBlock: completionBlock)
    }

    func locAction() {
        mapView.removeAnnotations(mapView.annotations)

        locationManager.requestLocation(withReGeocode: false, completionBlock: completionBlock)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        initToolBar()
        initNavigationBar()
        initMapView()
        initCompleteBlock()
        configLocationManager()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: false)
    }

    // MARK: - Initialization
    func initCompleteBlock() {

        completionBlock = { [weak self] (location: CLLocation?, regeocode: AMapLocationReGeocode?, error: Error?) in

            if let error = error {
                let error = error as NSError
                NSLog("locError:{\(error.code) - \(error.localizedDescription)};")

                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    return
                }
            }

            if let location = location {
                let annotation = MAPointAnnotation()
                annotation.coordinate = location.coordinate

                if let regeocode = regeocode {
                    annotation.title = regeocode.formattedAddress
                    annotation.subtitle = "\(regeocode.citycode!)-\(regeocode.adcode!)-\(location.horizontalAccuracy)m"
                } else {
                    annotation.title = String(format: "lat:%.6f;lon:%.6f;", arguments: [location.coordinate.latitude, location.coordinate.longitude])
                    annotation.subtitle = "accuracy:\(location.horizontalAccuracy)m"
                }

                self?.addAnnotationsToMapView(annotation)
            }
        }
    }

    func initMapView() {
        mapView = MAMapView(frame: view.bounds)
        mapView.delegate = self

        view.addSubview(mapView)
    }

    func addAnnotationsToMapView(_ annotation: MAAnnotation) {
        mapView.addAnnotation(annotation)

        mapView.selectAnnotation(annotation, animated: true)
        mapView.setZoomLevel(15.1, animated: false)
        mapView.setCenter(annotation.coordinate, animated: true)
    }

    func initToolBar() {
        let flexble = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let reGeocodeItem = UIBarButtonItem(title: "带逆地理定位", style: .plain, target: self, action: #selector(reGeocodeAction))
        let locItem = UIBarButtonItem(title: "不带逆地理定位", style: .plain, target: self, action: #selector(locAction))

        setToolbarItems([flexble, reGeocodeItem, flexble, locItem, flexble], animated: false)
    }

    func initNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clean", style: .plain, target: self, action: #selector(cleanUpAction))
    }

    // MARK: - MAMapVie Delegate
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation is MAPointAnnotation {
            let pointReuseIndetifier = "pointReuseIndetifier"

            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: pointReuseIndetifier) as? MAPinAnnotationView

            if annotationView == nil {
                annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: pointReuseIndetifier)
            }

            annotationView?.canShowCallout = true
            annotationView?.animatesDrop = true
            annotationView?.isDraggable = false
            annotationView?.pinColor = .purple

            return annotationView
        }
        return nil
    }
}
