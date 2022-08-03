//
//  CustomCollectionCellViewModel.swift
//  Pokedex
//
//  Created by Leonardo G. G.  Almeida on 02/08/22.
//

import Foundation

class CustomCollectionCellViewModel {
    private var pokemonList: PokemonListModel
    
    init(pokemonList: PokemonListModel) {
        self.pokemonList = pokemonList
    }
    
    func getID() -> Int {
        return pokemonList.id
    }
    
    func getName() -> String {
        return pokemonList.name
    }
    
    func getPokedexNumber() -> String {
        let pokedexNumber = pokemonList.pokedexNumber
        return String(format: "#%03d", pokedexNumber)
    }
    
    func getPrimaryType() -> String {
        return pokemonList.type1 
    }
    
    func getSecondaryType() -> String {
        return pokemonList.type2 ?? ""
    }
}
