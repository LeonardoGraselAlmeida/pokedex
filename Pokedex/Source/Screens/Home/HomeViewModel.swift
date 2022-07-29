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
    
    func getPokedexNumber(at index: Int) -> String {
        let pokedexNumber = pokemons[index].pokedexNumber ?? 0
        return String(format: "#%03d", pokedexNumber)
    }
    
    func getPrimaryType(at index: Int) -> String {
        return pokemons[index].type1 ?? ""
    }
    
    func getSecondaryType(at index: Int) -> String {
        return pokemons[index].type2 ?? ""
    }
    
    func setupCell(index: Int, cell: CustomCollectionViewCell) {
        let type1 = getPrimaryType(at: index)
        let type2 = getSecondaryType(at: index)
        
        cell.cardView.backgroundColor = BaseColor.shared.getColor(type: type1)
        cell.cardView.pokedexNumberLabel.text = getPokedexNumber(at: index)
        cell.cardView.title.text = getName(at: index)
        cell.cardView.primaryType.tagText.text = type1
        cell.cardView.secondaryType.tagText.text = type2
        cell.cardView.secondaryType.isHidden = type2.isEmpty
        cell.setIdPokemon(getID(at: index))
        
    }
    
    func fetchData(completionHandler: @escaping () -> Void) {
        let count = self.pokemons.count + 1
        
        let url = URL(string: "https://api-pokemons-go.herokuapp.com/pokemon/all/\(count)/20")!
        
        URLSession.shared.fetchData(for: url) { (result: Result<[Pokemon], Error>) in
            switch result {
            case .success(let newPokemons):
                self.pokemons.append(contentsOf: newPokemons)
                completionHandler()
            case .failure(let error):
                print(error)
            }
        }
    }
}
