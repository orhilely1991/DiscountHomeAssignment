

import Foundation
 
public class GetMovieVideosResponse {
	public var id : Int?
	public var results : Array<ResultsVideos>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [GetMovieVideosResponse]
    {
        var models:[GetMovieVideosResponse] = []
        for item in array
        {
            models.append(GetMovieVideosResponse(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		id = dictionary["id"] as? Int
        if (dictionary["results"] != nil) { results = ResultsVideos.modelsFromDictionaryArray(array: dictionary["results"] as! NSArray) }
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.id, forKey: "id")

		return dictionary
	}

}
