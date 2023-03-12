//
//  URLcollection.swift
//  OTTProject
//
//  Created by Jo on 15/02/23.
//

import Foundation

class URLcollection : NSObject{
    
    static let sharedURL = URLcollection()
    
    let baseURl = "https://api.themoviedb.org/3"
    
    let bageIMAGEURL = "https://image.tmdb.org/t/p/w500"
    
    let endURL = "?api_key=c77c9cdbbe2bfe7557cecde020f92321"
    
    // MARK: - TAIL URL
    
    let tailURl = "/movie/popular"
    let tailtopRatedMoiveUrl = "/movie/top_rated"
    let tailtrendingMovieUrl = "/trending/all/day"
    let tailtvShowUrl = "/tv/popular"
    
    
}




//Example Api Request : https://api.themoviedb.org/3//movie/{}?api_key=c77c9cdbbe2bfe7557cecde020f92321
//
//Api Key : c77c9cdbbe2bfe7557cecde020f92321
//
//Base Url : https://api.themoviedb.org/3/movie/550?

//class ApiUrls {
//  static const kBaseUrl = "https://api.themoviedb.org/3";
//  static const kimageBaseUrl = "https://image.tmdb.org/t/p/w500";

//  static const trendingMovieUrl = "$kBaseUrl/trending/all/day?api_key=$API_KEY";
//  static const topRatedMoiveUrl =
//      "$kBaseUrl/movie/top_rated?api_key=$API_KEY&language=en-US";

//  static const tvShowUrl =
//      "$kBaseUrl/tv/popular?api_key=$API_KEY&language=en-US&page=1";

//
