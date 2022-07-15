//
//  Data.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import Foundation

struct DataUrl: Codable {
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
