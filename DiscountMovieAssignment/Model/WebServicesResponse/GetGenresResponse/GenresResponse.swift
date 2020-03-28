

import Foundation
 

public class GenresResponse {
	public var genres : Array<Genres>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [GenresResponse]
    {
        var models:[GenresResponse] = []
        for item in array
        {
            models.append(GenresResponse(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

        if (dictionary["genres"] != nil) { genres = Genres.modelsFromDictionaryArray(array: dictionary["genres"] as! NSArray) }
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()


		return dictionary
	}

}
