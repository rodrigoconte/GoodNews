//
//  NewsNetworkManager.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/21/21.
//

import Foundation

class ArticlesNetworkManager: ArticlesWorkerManager {
    
    func getNews(completion: @escaping (Result<News, Error>) -> Void) {
        let rest = RESTService<ArticlesAPI>()
        
        rest.request(.getNews) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
}
