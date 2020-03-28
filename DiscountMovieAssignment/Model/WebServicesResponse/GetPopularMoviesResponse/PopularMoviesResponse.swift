

import Foundation
 

public class PopularMoviesResponse {
	public var page : Int?
	public var results : Array<Results>?
	public var total_results : Int?
	public var total_pages : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [PopularMoviesResponse]
    {
        var models:[PopularMoviesResponse] = []
        for item in array
        {
            models.append(PopularMoviesResponse(dictionary: item as! NSDictionary)!)
        }
        return models
    }


	required public init?(dictionary: NSDictionary) {

		page = dictionary["page"] as? Int
        if (dictionary["results"] != nil) { results = Results.modelsFromDictionaryArray(array: dictionary["results"] as! NSArray) }
		total_results = dictionary["total_results"] as? Int
		total_pages = dictionary["total_pages"] as? Int
	}


	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.page, forKey: "page")
		dictionary.setValue(self.total_results, forKey: "total_results")
		dictionary.setValue(self.total_pages, forKey: "total_pages")

		return dictionary
	}

}
