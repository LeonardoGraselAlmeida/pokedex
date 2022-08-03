//
//  UICardView.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class UICardView: UIView {
    
    lazy var title: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 14)
        label.text = ""
        label.textColor = .white
        
        return label
    }()
    
    lazy var primaryType: UITagView = {
        var tagView = UITagView()
        return tagView
    }()
    
    lazy var secondaryType: UITagView = {
        var tagView = UITagView()
        return tagView
    }()
    
    lazy var pokeballImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pokeball_white")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var pokemonImageView: UIImagePokemonView = {
        let imageView = UIImagePokemonView(frame: .zero, pokemonID: 0)
        return imageView
    }()
    
    lazy var pokedexNumberLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 12)
        label.text = "#000"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCardView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 16
        clipsToBounds = true
        setConstraints()
    }
    
    func setConstraints() {
        addSubview(title)
        addSubview(pokedexNumberLabel)
        addSubview(primaryType)
        addSubview(secondaryType)
        addSubview(pokeballImageView)
        addSubview(pokemonImageView)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 150),
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 22),
            
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 28),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            pokedexNumberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            pokedexNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            primaryType.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            primaryType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            secondaryType.topAnchor.constraint(equalTo: primaryType.bottomAnchor, constant: 8),
            secondaryType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            pokeballImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            pokeballImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            pokeballImageView.heightAnchor.constraint(equalToConstant: 100),
            pokeballImageView.widthAnchor.constraint(equalToConstant: 120),
            
            pokemonImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            pokemonImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 80),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
}
