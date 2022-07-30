//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 24/07/22.
//

import Foundation

class PokemonDetailViewModel {
    let pokemonDetail: PokemonDetail?
    
    init(with pokemonDetail: PokemonDetail) {
        self.pokemonDetail = pokemonDetail
    }
    
    public func getPokemonName() -> String {
        return self.pokemonDetail?.name.capitalized ?? ""
    }
    
    public func getPokedexNumber() -> String {
        let pokedexNumber = self.pokemonDetail?.id ?? 0
        return String(format: "#%03d", pokedexNumber)
    }
    
    public func getPrimaryType() -> String {
        return self.pokemonDetail?.types[0].type.name ?? ""
    }
    
    public func getSecondaryType() -> String {
        let typesCount = self.pokemonDetail?.types.count ?? 0
        
        if(typesCount > 1) {
            guard let type = self.pokemonDetail?.types[1].type.name else {
                return ""
            }
            
            return type
        }
        
        return ""
    }
    
    func getUrlImagePokemon() -> String {
        return "https://cdn.traction.one/pokedex/pokemon/\(self.pokemonDetail?.id ?? 0).png"
    }
    
    func getSpecie() -> String {
        return self.pokemonDetail?.species?.name.capitalized ?? ""
    }
    
    func getHeight() -> String {
        return String(self.pokemonDetail?.height ?? 0)
    }
    
    func getWeight() -> String {
        return String(self.pokemonDetail?.weight ?? 0)
    }
    
    func getAbilities() -> String {
        let abilities = self.pokemonDetail?.abilities.map { $0.ability.name.capitalized }.joined(separator: ", ")
        return abilities ?? ""
    }
    
    func getHpStats() -> Int {
        if let stats = self.pokemonDetail?.stats.first(where: {$0.stat.name == "hp"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getAttackStats() -> Int {
        if let stats = self.pokemonDetail?.stats.first(where: {$0.stat.name == "attack"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getDefenseStats() -> Int {
        if let stats = self.pokemonDetail?.stats.first(where: {$0.stat.name == "defense"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getSpAttackStats() -> Int {
        if let stats = self.pokemonDetail?.stats.first(where: {$0.stat.name == "special-attack"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getSpDefenseStats() -> Int {
        if let stats = self.pokemonDetail?.stats.first(where: {$0.stat.name == "special-defense"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getSpeedStats() -> Int {
        if let stats = self.pokemonDetail?.stats.first(where: {$0.stat.name == "speed"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getTotalStats() -> Int {
        let stats = self.pokemonDetail?.stats.reduce(0) { $0 + $1.baseStat }
        return stats ?? 0
    }
    
}
