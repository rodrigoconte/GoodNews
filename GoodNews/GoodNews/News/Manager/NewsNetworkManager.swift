//
//  NewsNetworkManager.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/21/21.
//

import Foundation

class NewsNetworkManager: NewsWorkerManager {
    
    func getNews(completion: @escaping (Result<News, Error>) -> Void) {
        let rest = RESTService<NewsAPI>()
        
        rest.request(.getNews) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
}
