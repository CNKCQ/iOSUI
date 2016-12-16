//
//  CustomUserLocationViewController.swift
//  Maplocation
//
//  Created by KingCQ on 2016/12/16.
//  Copyright © 2016年 KingCQ. All rights reserved.
//  自定义样式定位点

class CustomUserLocationViewController: UIViewController, MAMapViewDelegate {
    
    var mapView: MAMapView!
    var customUserLocationView: MAAnnotationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.gray
        initMapView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 开启定位
        mapView.showsUserLocation = true
        mapView.customizeUserLocationAccuracyCircleRepresentation = true
        mapView.userTrackingMode = MAUserTrackingMode.follow
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initMapView() {
        mapView = MAMapView(frame: self.view.bounds)
        mapView.delegate = self
        mapView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        self.view.addSubview(mapView)
    }
    
    // MARK: - MAMapViewDelegate
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation.isKind(of: MAUserLocation.self) {
            let pointReuseIndetifier = "userLocationStyleReuseIndetifier"
            var annotationView: MAPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: pointReuseIndetifier) as! MAPinAnnotationView?
            
            if annotationView == nil {
                annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: pointReuseIndetifier)
            }
            
            annotationView?.image = UIImage.init(named: "userPosition")
            self.customUserLocationView = annotationView
            return annotationView!
        }
        
        return nil
    }
    
    func mapView(_ mapView:MAMapView!, rendererFor overlay:MAOverlay) -> MAOverlayRenderer! {
        if(overlay.isEqual(mapView.userLocationAccuracyCircle)) {
            let circleRender = MACircleRenderer.init(circle:mapView.userLocationAccuracyCircle)
            circleRender?.lineWidth = 2.0
            circleRender?.strokeColor = UIColor.lightGray
            circleRender?.fillColor = UIColor.red.withAlphaComponent(0.3)
            return circleRender
        }
        
        return nil
    }
    
    // 实时更新定位点(方向)
    func mapView(_ mapView:MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation:Bool ) {
        if(!updatingLocation && self.customUserLocationView != nil) {
            UIView.animate(withDuration: 0.1, animations: {
                let degree = userLocation.heading.trueHeading - Double(self.mapView.rotationDegree)
                let radian = (degree * M_PI) / 180.0
                self.customUserLocationView.transform = CGAffineTransform.init(rotationAngle: CGFloat(radian))
            })
        }
    }
}
