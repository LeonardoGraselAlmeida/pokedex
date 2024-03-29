//
//  NetworkError.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 30/07/22.
//

import Foundation

enum NetworkError: Error {
    case decodeError
    case noData
    case invalidURL
    case invalidStatusCode
    case networkError
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .decodeError:
            return "Error during data decoding"
        case .noData:
            return "Data error"
        case .invalidURL:
            return "Invalid URL"
        case .invalidStatusCode:
            return "Invalid status code"
        case .networkError:
            return "An error has occurred. Please verify your connection."
        }
    }
}
