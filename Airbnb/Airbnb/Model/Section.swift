//
//	Section.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Section : NSObject, NSCoding, Mappable{

	var articles : AnyObject?
	var destinations : AnyObject?
	var displayType : String?
	var giftCardPromotions : AnyObject?
	var guidebookItems : [GuidebookItem]?
	var listings : [AnyObject]?
	var promotions : AnyObject?
	var resultType : String?
	var seeAllInfo : AnyObject?
	var title : String?
	var tripTemplates : [AnyObject]?


	class func newInstance(map: Map) -> Mappable?{
		return Section()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		articles <- map["articles"]
		destinations <- map["destinations"]
		displayType <- map["display_type"]
		giftCardPromotions <- map["gift_card_promotions"]
		guidebookItems <- map["guidebook_items"]
		listings <- map["listings"]
		promotions <- map["promotions"]
		resultType <- map["result_type"]
		seeAllInfo <- map["see_all_info"]
		title <- map["title"]
		tripTemplates <- map["trip_templates"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         articles = aDecoder.decodeObject(forKey: "articles") as? AnyObject
         destinations = aDecoder.decodeObject(forKey: "destinations") as? AnyObject
         displayType = aDecoder.decodeObject(forKey: "display_type") as? String
         giftCardPromotions = aDecoder.decodeObject(forKey: "gift_card_promotions") as? AnyObject
         guidebookItems = aDecoder.decodeObject(forKey: "guidebook_items") as? [GuidebookItem]
         listings = aDecoder.decodeObject(forKey: "listings") as? [AnyObject]
         promotions = aDecoder.decodeObject(forKey: "promotions") as? AnyObject
         resultType = aDecoder.decodeObject(forKey: "result_type") as? String
         seeAllInfo = aDecoder.decodeObject(forKey: "see_all_info") as? AnyObject
         title = aDecoder.decodeObject(forKey: "title") as? String
         tripTemplates = aDecoder.decodeObject(forKey: "trip_templates") as? [AnyObject]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if articles != nil{
			aCoder.encode(articles, forKey: "articles")
		}
		if destinations != nil{
			aCoder.encode(destinations, forKey: "destinations")
		}
		if displayType != nil{
			aCoder.encode(displayType, forKey: "display_type")
		}
		if giftCardPromotions != nil{
			aCoder.encode(giftCardPromotions, forKey: "gift_card_promotions")
		}
		if guidebookItems != nil{
			aCoder.encode(guidebookItems, forKey: "guidebook_items")
		}
		if listings != nil{
			aCoder.encode(listings, forKey: "listings")
		}
		if promotions != nil{
			aCoder.encode(promotions, forKey: "promotions")
		}
		if resultType != nil{
			aCoder.encode(resultType, forKey: "result_type")
		}
		if seeAllInfo != nil{
			aCoder.encode(seeAllInfo, forKey: "see_all_info")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if tripTemplates != nil{
			aCoder.encode(tripTemplates, forKey: "trip_templates")
		}

	}

}