//
//  UIImagePokemonView.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 02/07/22.
//

import UIKit

class UIImagePokemonView: UIImageView {
    
    var url: String
    
    init(frame: CGRect, pokemonID: Int) {
        self.url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonID).png"
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .center
        
        loadFrom(URLAddress: url)
    }
}
