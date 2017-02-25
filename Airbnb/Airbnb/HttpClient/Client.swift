//
//  Client.swift
//  Airbnb
//
//  Created by KingCQ on 2017/2/21.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

enum Method: String {
    case get
    case post
    case put
    case patch
}

class Client {
    
    static let shared = Client()
    
    func request<T: Mappable>(call: Call<T>, success: ((_ result: T) -> ())?) {
        var request = URLRequest(url: URL(string: call.uri)!)
        request.httpMethod = call.method?.rawValue
        Alamofire.request(request).responseJSON { response in
          let result = Mapper<T>().map(JSONObject: response.result.value)!
            success?(result)
        }
        
    }
}


class Call<T: Mappable>: NSObject {
    var method: Method?
    var uri: String!

    init(method: Method = .get, uri: String) {
        self.method = method
        self.uri = uri
    }
    
    func request(success: ((_ result: T) -> ())?) {
        var request = URLRequest(url: URL(string: uri)!)
        request.httpMethod = method?.rawValue
        Alamofire.request(request).responseJSON { response in
            let result = Mapper<T>().map(JSONObject: response.result.value)!
            success?(result)
        }
    }
}




