//
//  SingleLocaitonAloneViewController.swift
//  Maplocation
//
//  Created by KingCQ on 2016/12/15.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

let DefaultLocationTimeout = 10
let DefaultReGeocodeTimeout = 5

class SingleLocaitonAloneViewController: BaseController, AMapLocationManagerDelegate {
    var locationManager: AMapLocationManager!
    var completionBlock: AMapLocatingCompletionBlock!
    var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        initToolBar()
        initNavigationBar()
        initCompleteBlock()
        configLocationManager()
        initDisplayLabel()
    }
    
    func configLocationManager() {
        locationManager = AMapLocationManager()
        locationManager.delegate = self
        //设置期望定位精度
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //设置不允许系统暂停定位
        locationManager.pausesLocationUpdatesAutomatically = false
        //设置允许在后台定位
        locationManager.allowsBackgroundLocationUpdates = true
        //设置定位超时时间
        locationManager.locationTimeout = DefaultLocationTimeout
        //设置逆地理超时时间
        locationManager.reGeocodeTimeout = DefaultReGeocodeTimeout
    }
    
    func cleanUpAction() {
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
        displayLabel.text = nil
    }
    
    func reGeocodeAction() {
        //进行单次带逆地理定位请求
        locationManager.requestLocation(withReGeocode: true, completionBlock: completionBlock)
    }
    
    func locAction() {
        locationManager.requestLocation(withReGeocode: false, completionBlock: completionBlock)
    }
    
    func initCompleteBlock() {
        completionBlock = { location, regeocode, error in
            print("Location \(location)\n", "Regeocode: \(regeocode)", "🌹")
            if error != nil {
                return
            }
            if location != nil {
                if regeocode != nil {
                    self.displayLabel.text = "\(regeocode?.formattedAddress) \n \(regeocode?.citycode)-\(regeocode?.adcode)-\(location?.horizontalAccuracy)m \(regeocode?.aoiName) \(regeocode?.number)"
                } else {
                    self.displayLabel.text = "lat:\(location?.coordinate.latitude);lon:\(location?.coordinate.longitude)\n accuracy: \(location?.horizontalAccuracy)m"
                }
                
            }
        }
    }
    
    func initToolBar() {
        let flexble = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let reGeocodeItem = UIBarButtonItem(title: "带逆地理定位", style: .plain, target: self, action: #selector(reGeocodeAction))
        let locItem = UIBarButtonItem(title: "不带逆地理定位", style: .plain, target: self, action: #selector(locAction))
        toolbarItems = [flexble, reGeocodeItem, flexble, locItem, flexble]
    }
    
    func initNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clean", style: .plain, target: self, action: #selector(cleanUpAction))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.toolbar.isTranslucent = true
        navigationController?.isToolbarHidden = false
    }
    
    func initDisplayLabel() {
        displayLabel = UILabel(frame : view.bounds)
        displayLabel.backgroundColor = .clear
        displayLabel.textColor = .black
        displayLabel.textAlignment = .center
        displayLabel.numberOfLines = 0
        view.addSubview(displayLabel)
    }
    
    deinit {
        cleanUpAction()
        completionBlock = nil
    }
    
}
