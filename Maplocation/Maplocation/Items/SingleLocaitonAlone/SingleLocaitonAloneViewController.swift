//
//  SingleLocaitonAloneViewController.swift
//  Maplocation
//
//  Created by KingCQ on 2016/12/15.
//  Copyright © 2016年 KingCQ. All rights reserved.
//  单次定位不带地图展示

class SingleLocaitonAloneViewController: BaseController, AMapLocationManagerDelegate {
    let defaultLocationTimeout = 10
    let defaultReGeocodeTimeout = 5
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
        // 设置期望定位精度
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        // 设置不允许系统暂停定位
        locationManager.pausesLocationUpdatesAutomatically = false
        // 设置允许在后台定位
        locationManager.allowsBackgroundLocationUpdates = true
        // 定位超时时间，最低2s，此处设置为10s
        locationManager.locationTimeout = defaultLocationTimeout
        // 逆地理请求超时时间，最低2s，此处设置为5s
        locationManager.reGeocodeTimeout = defaultReGeocodeTimeout
    }

    func cleanUpAction() {
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
        displayLabel.text = nil
    }

    func reGeocodeAction() {
        // 进行单次带逆地理定位请求
        locationManager.requestLocation(withReGeocode: true, completionBlock: completionBlock)
    }

    func locAction() {
        locationManager.requestLocation(withReGeocode: false, completionBlock: completionBlock)
    }

    func initCompleteBlock() {
        completionBlock = { [weak self] (location: CLLocation?, regeocode: AMapLocationReGeocode?, error: Error?) in
            if let error = error {
                let error = error as NSError
                print("locError:{\(error.code) - \(error.localizedDescription)};")

                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    return
                }
            }

            if let location = location {
                if let regeocode = regeocode {
                    self?.displayLabel.text = "\(regeocode.formattedAddress) \n \(regeocode.citycode!)-\(regeocode.adcode!)-\(location.horizontalAccuracy)m"
                } else {
                    self?.displayLabel.text = "lat:\(location.coordinate.latitude); lon:\(location.coordinate.longitude); accuracy:\(location.horizontalAccuracy)m"
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
        navigationController?.setToolbarHidden(false, animated: false)
    }

    func initDisplayLabel() {
        displayLabel = UILabel(frame: view.bounds)
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
