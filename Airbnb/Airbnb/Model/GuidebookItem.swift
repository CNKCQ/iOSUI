//
//	GuidebookItem.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class GuidebookItem : NSObject, NSCoding, Mappable{

	var boldSubtitle : String?
	var coverPhotos : [CoverPhoto]?
	var id : AnyObject?
	var nonBoldSubtitle : String?
	var queryParams : QueryParam?
	var type : Int?


	class func newInstance(map: Map) -> Mappable?{
		return GuidebookItem()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		boldSubtitle <- map["bold_subtitle"]
		coverPhotos <- map["cover_photos"]
		id <- map["id"]
		nonBoldSubtitle <- map["non_bold_subtitle"]
		queryParams <- map["query_params"]
		type <- map["type"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         boldSubtitle = aDecoder.decodeObject(forKey: "bold_subtitle") as? String
         coverPhotos = aDecoder.decodeObject(forKey: "cover_photos") as? [CoverPhoto]
         id = aDecoder.decodeObject(forKey: "id") as? AnyObject
         nonBoldSubtitle = aDecoder.decodeObject(forKey: "non_bold_subtitle") as? String
         queryParams = aDecoder.decodeObject(forKey: "query_params") as? QueryParam
         type = aDecoder.decodeObject(forKey: "type") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if boldSubtitle != nil{
			aCoder.encode(boldSubtitle, forKey: "bold_subtitle")
		}
		if coverPhotos != nil{
			aCoder.encode(coverPhotos, forKey: "cover_photos")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if nonBoldSubtitle != nil{
			aCoder.encode(nonBoldSubtitle, forKey: "non_bold_subtitle")
		}
		if queryParams != nil{
			aCoder.encode(queryParams, forKey: "query_params")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}

	}

}