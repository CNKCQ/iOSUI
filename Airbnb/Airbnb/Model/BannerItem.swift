//
//	BannerItem.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper

class BannerItem: NSObject, NSCoding, Mappable {

	var detail: String?
	var href: String?
	var id: Int?
	var img: String?
	var name: String?
	var pubDate: String?
	var type: Int?


	class func newInstance(_ map: Map) -> Mappable? {
		return BannerItem()
	}

    required init?(map: Map) {
        super.init()
    }

	fileprivate override init() {}

	func mapping(map: Map) {
		detail <- map["detail"]
		href <- map["href"]
		id <- map["id"]
		img <- map["img"]
		name <- map["name"]
		pubDate <- map["pubDate"]
		type <- map["type"]

	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder) {
         detail = aDecoder.decodeObject(forKey: "detail") as? String
         href = aDecoder.decodeObject(forKey: "href") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         img = aDecoder.decodeObject(forKey: "img") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         pubDate = aDecoder.decodeObject(forKey: "pubDate") as? String
         type = aDecoder.decodeObject(forKey: "type") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder) {
		if detail != nil {
			aCoder.encode(detail, forKey: "detail")
		}
		if href != nil {
			aCoder.encode(href, forKey: "href")
		}
		if id != nil {
			aCoder.encode(id, forKey: "id")
		}
		if img != nil {
			aCoder.encode(img, forKey: "img")
		}
		if name != nil {
			aCoder.encode(name, forKey: "name")
		}
		if pubDate != nil {
			aCoder.encode(pubDate, forKey: "pubDate")
		}
		if type != nil {
			aCoder.encode(type, forKey: "type")
		}

	}

}
