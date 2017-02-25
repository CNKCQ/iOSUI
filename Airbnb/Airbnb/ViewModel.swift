//
//  BannerViewModel.swift
//  Airbnb
//
//  Created by KingCQ on 2017/2/24.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import Alamofire
import ObjectMapper

class ViewModel {
    
    static let shared = ViewModel()
    
    func banner() -> SignalProducer<BannerRootClass<BannerItem>, NSError> {
        return request()
    }
    
    func request<M: Mappable>() -> SignalProducer<M, NSError> {
        return SignalProducer<M, NSError> { observer, disposable in
//            var request = URLRequest(url: URL(string: "http://www.oschina.net/action/apiv2/banner/?catalog=1")!)
//            request.httpMethod = HTTPMethod.get.rawValue
//            Alamofire.request(request).responseJSON(completionHandler: { response in
//                let result = Mapper<M>().map(JSONObject: response.result.value)
//                let ok = Mapper<BannerRootClass<BannerItem>>().map(JSONObject: response.result.value)
//                print(ok?.result?.items)
//                observer.send(value: result!)
//                observer.sendCompleted()
//            })
            
            
        }
    }
    
    func content<M: Mappable>(callback: @escaping (M)->()) {
        var request = URLRequest(url: URL(string: "http://www.oschina.net/action/apiv2/banner/?catalog=1")!)
        request.httpMethod = HTTPMethod.get.rawValue
        Alamofire.request(request).responseJSON { response in
            let result = Mapper<M>().map(JSONObject: response.result.value!)!
            callback(result)
        }
    }
}
