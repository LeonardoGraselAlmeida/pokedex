//
//  NetworkRequest.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 30/07/22.
//

import Foundation

struct NetworkRequest {
    var endpointURL: String
    var method: HTTPMethod
}

enum HTTPMethod: String {
    case get
    case post
    case put
    case patch
    case delete
}
