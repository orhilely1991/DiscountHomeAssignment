
import Foundation
 
public class Results {
	public var poster_path : String?
	public var adult : Bool?
	public var overview : String?
	public var release_date : String?
	public var genre_ids : Array<Int>?
	public var id : Int?
	public var original_title : String?
	public var original_language : String?
	public var title : String?
	public var backdrop_path : String?
	public var popularity : Double?
	public var vote_count : Int?
	public var video : Bool?
	public var vote_average : Double?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Results]
    {
        var models:[Results] = []
        for item in array
        {
            models.append(Results(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		poster_path = dictionary["poster_path"] as? String
		adult = dictionary["adult"] as? Bool
		overview = dictionary["overview"] as? String
		release_date = dictionary["release_date"] as? String
		if (dictionary["genre_ids"] != nil) { genre_ids = (dictionary["genre_ids"] as! Array<Int>) }
		id = dictionary["id"] as? Int
		original_title = dictionary["original_title"] as? String
		original_language = dictionary["original_language"] as? String
		title = dictionary["title"] as? String
		backdrop_path = dictionary["backdrop_path"] as? String
		popularity = dictionary["popularity"] as? Double
		vote_count = dictionary["vote_count"] as? Int
		video = dictionary["video"] as? Bool
		vote_average = dictionary["vote_average"] as? Double
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.poster_path, forKey: "poster_path")
		dictionary.setValue(self.adult, forKey: "adult")
		dictionary.setValue(self.overview, forKey: "overview")
		dictionary.setValue(self.release_date, forKey: "release_date")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.original_title, forKey: "original_title")
		dictionary.setValue(self.original_language, forKey: "original_language")
		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.backdrop_path, forKey: "backdrop_path")
		dictionary.setValue(self.popularity, forKey: "popularity")
		dictionary.setValue(self.vote_count, forKey: "vote_count")
		dictionary.setValue(self.video, forKey: "video")
		dictionary.setValue(self.vote_average, forKey: "vote_average")

		return dictionary
	}

}
