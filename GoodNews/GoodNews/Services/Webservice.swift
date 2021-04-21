//
//  Webservice.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/21/21.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping (News?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(News.self, from: data)
                    completion(object)
                } catch {
                    completion(nil)
                    print(error.localizedDescription)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
    
}
