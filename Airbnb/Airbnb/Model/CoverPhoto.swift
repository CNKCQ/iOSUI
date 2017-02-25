//
//	CoverPhoto.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class CoverPhoto : NSObject, NSCoding, Mappable{

	var picture : String?
	var xlPicture : String?


	class func newInstance(map: Map) -> Mappable?{
		return CoverPhoto()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		picture <- map["picture"]
		xlPicture <- map["xl_picture"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         picture = aDecoder.decodeObject(forKey: "picture") as? String
         xlPicture = aDecoder.decodeObject(forKey: "xl_picture") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if picture != nil{
			aCoder.encode(picture, forKey: "picture")
		}
		if xlPicture != nil{
			aCoder.encode(xlPicture, forKey: "xl_picture")
		}

	}

}