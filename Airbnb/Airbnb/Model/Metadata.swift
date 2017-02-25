//
//	Metadata.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Metadata : NSObject, NSCoding, Mappable{

	var currentTabId : String?
	var paramOverrides : AnyObject?
	var requestUuid : String?


	class func newInstance(map: Map) -> Mappable?{
		return Metadata()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		currentTabId <- map["current_tab_id"]
		paramOverrides <- map["param_overrides"]
		requestUuid <- map["request_uuid"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         currentTabId = aDecoder.decodeObject(forKey: "current_tab_id") as? String
         paramOverrides = aDecoder.decodeObject(forKey: "param_overrides") as? AnyObject
         requestUuid = aDecoder.decodeObject(forKey: "request_uuid") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if currentTabId != nil{
			aCoder.encode(currentTabId, forKey: "current_tab_id")
		}
		if paramOverrides != nil{
			aCoder.encode(paramOverrides, forKey: "param_overrides")
		}
		if requestUuid != nil{
			aCoder.encode(requestUuid, forKey: "request_uuid")
		}

	}

}