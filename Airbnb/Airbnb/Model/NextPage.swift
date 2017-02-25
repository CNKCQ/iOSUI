//
//	NextPage.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class NextPage : NSObject, NSCoding, Mappable{

	var isSeeMore : Bool?
	var markets : AnyObject?
	var sectionLimit : Int?
	var sectionName : AnyObject?
	var sectionOffset : Int?
	var sectionType : AnyObject?
	var subCategories : AnyObject?
	var titleDefault : AnyObject?
	var titleKey : AnyObject?
	var topCategories : AnyObject?


	class func newInstance(map: Map) -> Mappable?{
		return NextPage()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		isSeeMore <- map["isSeeMore"]
		markets <- map["markets"]
		sectionLimit <- map["sectionLimit"]
		sectionName <- map["sectionName"]
		sectionOffset <- map["sectionOffset"]
		sectionType <- map["sectionType"]
		subCategories <- map["subCategories"]
		titleDefault <- map["titleDefault"]
		titleKey <- map["titleKey"]
		topCategories <- map["topCategories"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         isSeeMore = aDecoder.decodeObject(forKey: "isSeeMore") as? Bool
         markets = aDecoder.decodeObject(forKey: "markets") as? AnyObject
         sectionLimit = aDecoder.decodeObject(forKey: "sectionLimit") as? Int
         sectionName = aDecoder.decodeObject(forKey: "sectionName") as? AnyObject
         sectionOffset = aDecoder.decodeObject(forKey: "sectionOffset") as? Int
         sectionType = aDecoder.decodeObject(forKey: "sectionType") as? AnyObject
         subCategories = aDecoder.decodeObject(forKey: "subCategories") as? AnyObject
         titleDefault = aDecoder.decodeObject(forKey: "titleDefault") as? AnyObject
         titleKey = aDecoder.decodeObject(forKey: "titleKey") as? AnyObject
         topCategories = aDecoder.decodeObject(forKey: "topCategories") as? AnyObject

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if isSeeMore != nil{
			aCoder.encode(isSeeMore, forKey: "isSeeMore")
		}
		if markets != nil{
			aCoder.encode(markets, forKey: "markets")
		}
		if sectionLimit != nil{
			aCoder.encode(sectionLimit, forKey: "sectionLimit")
		}
		if sectionName != nil{
			aCoder.encode(sectionName, forKey: "sectionName")
		}
		if sectionOffset != nil{
			aCoder.encode(sectionOffset, forKey: "sectionOffset")
		}
		if sectionType != nil{
			aCoder.encode(sectionType, forKey: "sectionType")
		}
		if subCategories != nil{
			aCoder.encode(subCategories, forKey: "subCategories")
		}
		if titleDefault != nil{
			aCoder.encode(titleDefault, forKey: "titleDefault")
		}
		if titleKey != nil{
			aCoder.encode(titleKey, forKey: "titleKey")
		}
		if topCategories != nil{
			aCoder.encode(topCategories, forKey: "topCategories")
		}

	}

}