//
//  Pokemon.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//
import Foundation

struct Ability: Codable  {
    let ability: DataUrl?
    let slot: Int?
    
    enum CodingKeys: String, CodingKey {
        case ability
        case slot
    }
}

struct Other: Codable  {
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct OtherSpretie: Codable  {
    let dreamWorld: Other?
    let home: Other?
    let officialArtwork: Other?
    
    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official_artwork"
        case home
    }
}

struct Sprities: Codable  {
    let frontDefault: String?
    let backDefault: String?
    let backShiny: String?
    let frontShiny: String?
    let other: OtherSpretie?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontShiny = "front_shiny"
        case other
    }
}

struct Stat: Codable  {
    let baseStat: Int?
    let effort: Int?
    let stat: DataUrl?
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct Types: Codable  {
    let slot: Int?
    let type: DataUrl?
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}

struct PokemonDetail: Codable  {
    let id: Int?
    let baseExperience: Int?
    let height: Int?
    let weight: Int?
    let abilities: [Ability]?
    let name: String?
    let order: Int?
    let sprities: Sprities?
    let stats: [Stat]?
    let types: [Types]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case baseExperience = "base_experience"
        case height
        case weight
        case abilities
        case name
        case order
        case sprities
        case stats
        case types
    }
}
