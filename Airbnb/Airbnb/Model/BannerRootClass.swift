//
//	BannerRootClass.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class BannerRootClass<T: Mappable>: NSObject, NSCoding, Mappable {

	var code: Int?
	var message: String?
	var result: ListModel<T>?
	var time: String?


	class func newInstance(_ map: Map) -> Mappable? {
		return BannerRootClass()
	}
    required init?(map: Map) {
        super.init()
    }
	fileprivate override init() {}

	func mapping(map: Map) {
		code <- map["code"]
		message <- map["message"]
		result <- map["result"]
		time <- map["time"]
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         code = aDecoder.decodeObject(forKey: "code") as? Int
         message = aDecoder.decodeObject(forKey: "message") as? String
         result = aDecoder.decodeObject(forKey: "result") as? ListModel<T>
         time = aDecoder.decodeObject(forKey: "time") as? String
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if code != nil {
			aCoder.encode(code, forKey: "code")
		}
		if message != nil {
			aCoder.encode(message, forKey: "message")
		}
		if result != nil {
			aCoder.encode(result, forKey: "result")
		}
		if time != nil {
			aCoder.encode(time, forKey: "time")
		}

	}

}
