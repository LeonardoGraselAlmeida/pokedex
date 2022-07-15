//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class HomeViewModel {
    var pokemons: [Pokemon]
    
    init() {
        self.pokemons = []
    }
    
    func getID(at index: Int) -> Int {
        return pokemons[index].id ?? 0
    }
    
    func getName(at index: Int) -> String {
        return pokemons[index].name ?? ""
    }
    
    func getPokedexNumber(at index: Int) -> Int {
        return pokemons[index].pokedexNumber ?? 0
    }
    
    func getType1(at index: Int) -> String {
        return pokemons[index].type1 ?? ""
    }
    
    func getType2(at index: Int) -> String {
        return pokemons[index].type2 ?? ""
    }
    
    func getUrlImagePokemon(at index: Int) -> String {
        let id = getID(at: index)
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
    
    func setupCell(index: Int, cell: CustomCollectionViewCell) {
        let type1 = getType1(at: index)
        let type2 = getType2(at: index)
        
        cell.cardView.backgroundColor = BaseColor.shared.getColor(type: type1)
        cell.cardView.title.text = getName(at: index)
        cell.cardView.firstTag.tagText.text = type1
        cell.cardView.secondTag.tagText.text = type2
        cell.cardView.secondTag.isHidden = type2.isEmpty
        cell.cardView.pokemonImageView.loadFrom(URLAddress: getUrlImagePokemon(at: index))
        
    }
}
