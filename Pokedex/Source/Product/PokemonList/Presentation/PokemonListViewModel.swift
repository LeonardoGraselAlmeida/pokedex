//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import Foundation

class PokemonListViewModel {
    private var pokemons: [PokemonListModel]
    private var network: PokemonListNetwork
    
    init(network: PokemonListNetwork = PokemonListNetwork()) {
        self.pokemons = []
        self.network = network
    }
    
    var pokemonsCount: Int {
        return pokemons.count
    }
    
    func getPokemonList(at index: Int) -> PokemonListModel {
        return pokemons[index]
    }
    
    func fetchPokemonList(completionHandler: @escaping () -> Void) {
        let count = self.pokemons.count + 1
        
        network.fetchPokemonList(from: count) { (result: Result<[PokemonListModel], Error>) in
            switch result {
            case .success(let newPokemons):
                DispatchQueue.main.async {
                    self.pokemons.append(contentsOf: newPokemons)
                    completionHandler()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
