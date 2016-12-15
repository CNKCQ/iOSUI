//
//  AppDelegate.swift
//  Maplocation
//
//  Created by KingCQ on 2016/12/15.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        MapSDk.configLocation()
        return true
    }
}

/*
 0, 开发指南：http://lbs.amap.com/api/ios-location-sdk/guide/get-location/singlelocation/
 1, 要在iOS 9及以上版本使用后台定位功能, 需要保证"Background Modes"中的"Location updates"处于选中状态 App registers for location updates
 2, App Transport Security Settings Allow Arbitrary Loads true ATS设置
 3, Privacy - Location Always Usage Description AMapLocationKit需要定位权限才可以使用
 4, 提交AppStore必读: http://lbs.amap.com/api/ios-location-sdk/guide/crest-project/idfa-guide/
 */
