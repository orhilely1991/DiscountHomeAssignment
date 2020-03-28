//
//  WebServices.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 26/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit
import AFNetworking

class WebServices: NSObject {

    static let sharedInstance : WebServices = WebServices()
    let responseSerializer = AFJSONResponseSerializer()
    let requestSerializer = AFJSONRequestSerializer()
    
    func AFHTTPRequestManager()-> AFHTTPSessionManager
        {
            let manager : AFHTTPSessionManager = AFHTTPSessionManager()
            
            manager.requestSerializer = requestSerializer
            manager.responseSerializer = responseSerializer
            
            manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            return manager
        }
    
    func getGenres (_ Success : @escaping (_ Success : GenresResponse) -> Void , Error : @escaping (_ Error : ErrorResponse) -> Void)
    {
        let manager =   self.AFHTTPRequestManager()

        manager.get(RequestBuilder.getGenres(), parameters:nil,progress: nil, success: { (operation, responseObject) in
            manager.invalidateSessionCancelingTasks(true)
            do {
                if let result = responseObject as? NSDictionary
                {
                    let Object = GenresResponse(dictionary: result)
                    Success(Object!);
                }
            }
            
        }) { (operation,  error) in
            
            if let error = error as? NSDictionary
            {
                let Object = ErrorResponse(dictionary: error)
                Error(Object!);
            }
        }
    }
    
    func getPopularMoviesBy (pageNumber : Int, _ Success : @escaping (_ Success : PopularMoviesResponse) -> Void , Error : @escaping (_ Error : ErrorResponse) -> Void)
    {
        let manager =   self.AFHTTPRequestManager()

        let urlString = RequestBuilder.getPopularMovies() + "&page=" + String(pageNumber)
        manager.get(urlString, parameters:nil,progress: nil, success: { (operation, responseObject) in
            manager.invalidateSessionCancelingTasks(true)
            do {
                if let result = responseObject as? NSDictionary
                {
                    let Object = PopularMoviesResponse(dictionary: result)
                    Success(Object!);
                }
            }
            
        }) { (operation,  error) in
            
            if let error = error as? NSDictionary
            {
                let Object = ErrorResponse(dictionary: error)
                Error(Object!);
            }
        }
    }
    
    func getMovieVideos (movieId : Int, _ Success : @escaping (_ Success : GetMovieVideosResponse) -> Void , Error : @escaping (_ Error : ErrorResponse) -> Void)
    {
        let manager =   self.AFHTTPRequestManager()

        let urlString = RequestBuilder.getMovieVideos() + String(movieId) + "/videos" + AppConstants.ImportentKeys.ApiKey
        manager.get(urlString, parameters:nil,progress: nil, success: { (operation, responseObject) in
            manager.invalidateSessionCancelingTasks(true)
            do {
                if let result = responseObject as? NSDictionary
                {
                    let Object = GetMovieVideosResponse(dictionary: result)
                    Success(Object!);
                }
            }
            
        }) { (operation,  error) in
            
            if let error = error as? NSDictionary
            {
                let Object = ErrorResponse(dictionary: error)
                Error(Object!);
            }
        }
    }
}
