//
//	Airbnb.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Airbnb : NSObject, NSCoding, Mappable{

	var exploreTabs : [ExploreTab]?
	var metadata : Metadata?


	class func newInstance(map: Map) -> Mappable?{
		return Airbnb()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		exploreTabs <- map["explore_tabs"]
		metadata <- map["metadata"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         exploreTabs = aDecoder.decodeObject(forKey: "explore_tabs") as? [ExploreTab]
         metadata = aDecoder.decodeObject(forKey: "metadata") as? Metadata

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if exploreTabs != nil{
			aCoder.encode(exploreTabs, forKey: "explore_tabs")
		}
		if metadata != nil{
			aCoder.encode(metadata, forKey: "metadata")
		}

	}

}