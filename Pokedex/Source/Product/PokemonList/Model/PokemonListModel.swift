//
//  Pokemon.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import Foundation

struct PokemonListModel: Codable {
    let id: Int
    let name: String
    let pokedexNumber: Int
    let type1: String
    let type2: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pokedexNumber = "pokedex_number"
        case type1 = "type_1"
        case type2 = "type_2"
    }
}
