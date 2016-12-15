//
//  MapSDK.swift
//  Maplocation
//
//  Created by KingCQ on 2016/12/15.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

struct MapSDk {
    static func configLocation() {
        AMapServices.shared().apiKey = "fffb25cb54f79a6f28929aa269be6e68"
        AMapServices.shared().enableHTTPS = true // 从2017年1月1日起，苹果将要求所有提交到 App Store 的应用强制开启 ATS
    }
}
