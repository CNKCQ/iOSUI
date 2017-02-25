//
//	PaginationMetadata.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class PaginationMetadata : NSObject, NSCoding, Mappable{

	var hasNextPage : Bool?
	var sectionOffset : Int?


	class func newInstance(map: Map) -> Mappable?{
		return PaginationMetadata()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		hasNextPage <- map["has_next_page"]
		sectionOffset <- map["section_offset"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         hasNextPage = aDecoder.decodeObject(forKey: "has_next_page") as? Bool
         sectionOffset = aDecoder.decodeObject(forKey: "section_offset") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if hasNextPage != nil{
			aCoder.encode(hasNextPage, forKey: "has_next_page")
		}
		if sectionOffset != nil{
			aCoder.encode(sectionOffset, forKey: "section_offset")
		}

	}

}