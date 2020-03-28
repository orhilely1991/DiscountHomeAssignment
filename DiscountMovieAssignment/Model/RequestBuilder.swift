//
//  RequestBuilder.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 26/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

class RequestBuilder: NSObject {

    public struct StringsForSevice{
        static let getGenres : String = "/genre/movie/list";
        static let getPopular : String = "/movie/popular"
        static let getMovieVideos: String = "/movie/"
    }
    
    public struct ServicePath{
        static let Base : String = "https://api.themoviedb.org/3"
        static let BaseImage : String = "https://image.tmdb.org/t/p/w500"
    }
    
    class func getGenres() -> String{
        
        return  ServicePath.Base + StringsForSevice.getGenres + AppConstants.ImportentKeys.ApiKey
    }
    
    class func getPopularMovies() -> String{
        
        return ServicePath.Base + StringsForSevice.getPopular + AppConstants.ImportentKeys.ApiKey
    }
    class func getMovieVideos() -> String{
        
        return ServicePath.Base + StringsForSevice.getMovieVideos
    }
}
