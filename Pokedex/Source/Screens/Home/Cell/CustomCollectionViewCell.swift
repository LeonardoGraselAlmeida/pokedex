//
//  CustomTableViewCell.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CustomCollectionViewCell"
    
    var cardView: UICardView = {
        let card = UICardView()
        return card
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cardView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setIdPokemon(_ id: Int) {
        cardView.pokemonImageView.loadFrom(URLAddress: getUrlImagePokemon(with: id)) {
            self.cardView.pokemonImageView.activityView.stopAnimating()
        }
    }
    
    func getUrlImagePokemon(with id: Int) -> String {
        return "https://cdn.traction.one/pokedex/pokemon/\(id).png"
    }
    
}
