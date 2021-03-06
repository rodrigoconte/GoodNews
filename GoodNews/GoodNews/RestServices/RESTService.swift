//
//  RESTService.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/21/21.
//

import Foundation

class RESTService<T: RESTRequest> {
    
    func request<U:Decodable>(_ request: T, completion: @escaping (Result<U, Error>) -> Void) {
        guard let url = createURL(with: request) else {
            completion(.failure(RESTError.failedToCreateURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod.rawValue
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(U.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error ?? NSError()))
            }
        }.resume()
    }
    
    private func createURL(with request: T) -> URL? {
        var urlComponents = URLComponents(string: request.baseURL)
        urlComponents?.path = request.path
        urlComponents?.queryItems = request.queryItems
        
        return urlComponents?.url
    }
    
}
