//
//  RESTError.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/21/21.
//

import Foundation

enum RESTError {
    case failedToCreateURL
}

extension RESTError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .failedToCreateURL:
            return "Error while URL creation"
        }
    }
    
}
