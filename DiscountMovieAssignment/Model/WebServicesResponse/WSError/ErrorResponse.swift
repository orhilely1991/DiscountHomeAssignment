
import Foundation
 
public class ErrorResponse {
	public var status_message : String?
	public var success : Bool?
	public var status_code : Int?

    public class func modelsFromDictionaryArray(array:NSArray) -> [ErrorResponse]
    {
        var models:[ErrorResponse] = []
        for item in array
        {
            models.append(ErrorResponse(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		status_message = dictionary["status_message"] as? String
		success = dictionary["success"] as? Bool
		status_code = dictionary["status_code"] as? Int
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.status_message, forKey: "status_message")
		dictionary.setValue(self.success, forKey: "success")
		dictionary.setValue(self.status_code, forKey: "status_code")

		return dictionary
	}

}
