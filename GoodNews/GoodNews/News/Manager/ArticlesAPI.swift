//
//  NewsAPI.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/21/21.
//

import Foundation

enum ArticlesAPI {
    case getNews
}

extension ArticlesAPI: RESTRequest {
    
    var baseURL: String {
        return "https://newsapi.org"
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/v2/top-headlines"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        let country = "br"
        let countryQueryItem = URLQueryItem(name: "country", value: country)
        
        let apiKey = "c4cddd4880ea4b5aa81f512e040bbfda"
        let apiKeyQueryItem = URLQueryItem(name: "apiKey", value: apiKey)
        
        return [countryQueryItem, apiKeyQueryItem]
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getNews:
            return .get
        }
    }
    
}
