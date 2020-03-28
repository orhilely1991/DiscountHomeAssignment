
import Foundation
 
public class ResultsVideos {
	public var id : String?
	public var iso_639_1 : String?
	public var iso_3166_1 : String?
	public var key : String?
	public var name : String?
	public var site : String?
	public var size : Int?
	public var type : String?
    public var didLoad : Bool = false

    public class func modelsFromDictionaryArray(array:NSArray) -> [ResultsVideos]
    {
        var models:[ResultsVideos] = []
        for item in array
        {
            models.append(ResultsVideos(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		id = dictionary["id"] as? String
		iso_639_1 = dictionary["iso_639_1"] as? String
		iso_3166_1 = dictionary["iso_3166_1"] as? String
		key = dictionary["key"] as? String
		name = dictionary["name"] as? String
		site = dictionary["site"] as? String
		size = dictionary["size"] as? Int
		type = dictionary["type"] as? String
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.iso_639_1, forKey: "iso_639_1")
		dictionary.setValue(self.iso_3166_1, forKey: "iso_3166_1")
		dictionary.setValue(self.key, forKey: "key")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.site, forKey: "site")
		dictionary.setValue(self.size, forKey: "size")
		dictionary.setValue(self.type, forKey: "type")

		return dictionary
	}

}
