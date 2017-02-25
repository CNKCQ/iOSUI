//
//	PlaceTabMetadata.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class PlaceTabMetadata : NSObject, NSCoding, Mappable{

	var message : AnyObject?
	var nextPage : NextPage?
	var status : String?
	var totalPlaceSearchHits : Int?


	class func newInstance(map: Map) -> Mappable?{
		return PlaceTabMetadata()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		message <- map["message"]
		nextPage <- map["nextPage"]
		status <- map["status"]
		totalPlaceSearchHits <- map["totalPlaceSearchHits"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         message = aDecoder.decodeObject(forKey: "message") as? AnyObject
         nextPage = aDecoder.decodeObject(forKey: "nextPage") as? NextPage
         status = aDecoder.decodeObject(forKey: "status") as? String
         totalPlaceSearchHits = aDecoder.decodeObject(forKey: "totalPlaceSearchHits") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if message != nil{
			aCoder.encode(message, forKey: "message")
		}
		if nextPage != nil{
			aCoder.encode(nextPage, forKey: "nextPage")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if totalPlaceSearchHits != nil{
			aCoder.encode(totalPlaceSearchHits, forKey: "totalPlaceSearchHits")
		}

	}

}