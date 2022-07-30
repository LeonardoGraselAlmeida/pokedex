//
//  PokemonDetailNetwork.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 30/07/22.
//

import Foundation

class PokemonNetwork {
    
    private final let networkManager = NetworkManager()
    
    func fetchPokemonList<T>(from index:Int, completion: @escaping NetworkResult<T>) {
        let request = NetworkRequest(endpointURL: "https://api-pokemons-go.herokuapp.com/pokemon/all/\(index)/20",
                                     method: .get)
        
        self.networkManager.request(request) { (result: Result<T, Error>) in
            completion(result)
        }
    }
    
    func fetchPokemonDetail<T>(from pokemonId:Int, completion: @escaping NetworkResult<T>) {
        let request = NetworkRequest(endpointURL: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)",
                                     method: .get)
        
        self.networkManager.request(request) { (result: Result<T, Error>) in
            completion(result)
        }
    }
}
