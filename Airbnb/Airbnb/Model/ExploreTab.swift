//
//	ExploreTab.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ExploreTab : NSObject, NSCoding, Mappable{

	var emptyStateMetadata : AnyObject?
	var experienceTabMetadata : AnyObject?
	var homeTabMetadata : AnyObject?
	var paginationMetadata : PaginationMetadata?
	var placeTabMetadata : PlaceTabMetadata?
	var sections : [Section]?
	var tabId : String?
	var tabName : String?


	class func newInstance(map: Map) -> Mappable?{
		return ExploreTab()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		emptyStateMetadata <- map["empty_state_metadata"]
		experienceTabMetadata <- map["experience_tab_metadata"]
		homeTabMetadata <- map["home_tab_metadata"]
		paginationMetadata <- map["pagination_metadata"]
		placeTabMetadata <- map["place_tab_metadata"]
		sections <- map["sections"]
		tabId <- map["tab_id"]
		tabName <- map["tab_name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         emptyStateMetadata = aDecoder.decodeObject(forKey: "empty_state_metadata") as? AnyObject
         experienceTabMetadata = aDecoder.decodeObject(forKey: "experience_tab_metadata") as? AnyObject
         homeTabMetadata = aDecoder.decodeObject(forKey: "home_tab_metadata") as? AnyObject
         paginationMetadata = aDecoder.decodeObject(forKey: "pagination_metadata") as? PaginationMetadata
         placeTabMetadata = aDecoder.decodeObject(forKey: "place_tab_metadata") as? PlaceTabMetadata
         sections = aDecoder.decodeObject(forKey: "sections") as? [Section]
         tabId = aDecoder.decodeObject(forKey: "tab_id") as? String
         tabName = aDecoder.decodeObject(forKey: "tab_name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if emptyStateMetadata != nil{
			aCoder.encode(emptyStateMetadata, forKey: "empty_state_metadata")
		}
		if experienceTabMetadata != nil{
			aCoder.encode(experienceTabMetadata, forKey: "experience_tab_metadata")
		}
		if homeTabMetadata != nil{
			aCoder.encode(homeTabMetadata, forKey: "home_tab_metadata")
		}
		if paginationMetadata != nil{
			aCoder.encode(paginationMetadata, forKey: "pagination_metadata")
		}
		if placeTabMetadata != nil{
			aCoder.encode(placeTabMetadata, forKey: "place_tab_metadata")
		}
		if sections != nil{
			aCoder.encode(sections, forKey: "sections")
		}
		if tabId != nil{
			aCoder.encode(tabId, forKey: "tab_id")
		}
		if tabName != nil{
			aCoder.encode(tabName, forKey: "tab_name")
		}

	}

}