//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 24/07/22.
//

import Foundation

class PokemonDetailViewModel {
    private var pokemonDetails: PokemonDetail
    private var network: PokemonDetailNetwork
    
    init(with pokemonDetails: PokemonDetail, network: PokemonDetailNetwork = PokemonDetailNetwork()) {
        self.pokemonDetails = pokemonDetails
        self.network = network
    }
    
    public func getPokemonName() -> String {
        return self.pokemonDetails.name.capitalized
    }
    
    public func getPokedexNumber() -> String {
        let pokedexNumber = self.pokemonDetails.id
        return String(format: "#%03d", pokedexNumber)
    }
    
    public func getPrimaryType() -> String {
        return self.pokemonDetails.types[0].type.name
    }
    
    public func getSecondaryType() -> String {
        let types =  self.pokemonDetails.types
        let typesHasTwoTypes = types.count >= 2
        
        if(typesHasTwoTypes) {
            let data = types[1]
            return data.type.name
        }
        
        return ""
    }
    
    func getUrlImagePokemon() -> String {
        return "https://cdn.traction.one/pokedex/pokemon/\(self.pokemonDetails.id).png"
    }
    
    func getSpecie() -> String {
        return self.pokemonDetails.species?.name.capitalized ?? ""
    }
    
    func getHeight() -> String {
        return String(self.pokemonDetails.height)
    }
    
    func getWeight() -> String {
        return String(self.pokemonDetails.weight)
    }
    
    func getAbilities() -> String {
        let abilities = self.pokemonDetails.abilities.map { $0.ability.name.capitalized }.joined(separator: ", ")
        return abilities
    }
    
    func getHpStats() -> Int {
        if let stats = self.pokemonDetails.stats.first(where: {$0.stat.name == "hp"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getAttackStats() -> Int {
        if let stats = self.pokemonDetails.stats.first(where: {$0.stat.name == "attack"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getDefenseStats() -> Int {
        if let stats = self.pokemonDetails.stats.first(where: {$0.stat.name == "defense"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getSpAttackStats() -> Int {
        if let stats = self.pokemonDetails.stats.first(where: {$0.stat.name == "special-attack"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getSpDefenseStats() -> Int {
        if let stats = self.pokemonDetails.stats.first(where: {$0.stat.name == "special-defense"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getSpeedStats() -> Int {
        if let stats = self.pokemonDetails.stats.first(where: {$0.stat.name == "speed"}) {
            return stats.baseStat
        }
        
        return 0
    }
    
    func getTotalStats() -> Int {
        let stats = self.pokemonDetails.stats.reduce(0) { $0 + $1.baseStat }
        return stats
    }
    
    func fetchPokemonDetail(completionHandler: @escaping () -> Void) {
        self.network.fetchPokemonDetail(from: pokemonDetails.id) { (result: Result<PokemonDetail, Error>) in
            switch result {
            case .success(let pokemonDetails):
                DispatchQueue.main.async {
                    self.pokemonDetails = pokemonDetails
                    completionHandler()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
