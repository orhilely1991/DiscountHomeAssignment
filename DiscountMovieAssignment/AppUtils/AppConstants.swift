//
//  AppConstants.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 26/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

class AppConstants: NSObject {

    static let youtubePrefix = "http://img.youtube.com/vi/"
    public struct ImportentKeys{
        static let ApiKey : String = "?api_key=f6f8c383afba5cb8be0393c24ae0a098"
    }
    
    enum MovieDetailsCells : Int{
        case title = 0, overview, releaseDate, poster, trailer
    }
    
    static let genresColors : [UIColor] = [UIColor.customPinkColor(), UIColor.customRedColor(), UIColor.customOrangeColor(), UIColor.customYellowColor(), UIColor.customGreenColor(), UIColor.customLightBlueColor(), UIColor.customBlueColor()]
}
