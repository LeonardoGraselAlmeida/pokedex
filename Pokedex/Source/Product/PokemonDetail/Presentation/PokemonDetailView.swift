//
//  DetailView.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 24/07/22.
//

import UIKit

class PokemonDetailView: UIView {
    
    // MARK: - UI
    lazy var pokedexNumberLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 14)
        label.textColor = .white
        return label
    }()
    
    lazy var pokemonLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 24)
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
        imageView.layer.zPosition = 2
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var containerView: UIView = {
        let stack = UIView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        stack.layer.cornerRadius = 30
        
        return stack
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl()
        
        segmented.insertSegment(withTitle: "About", at: 0, animated: false)
        segmented.insertSegment(withTitle: "Base Stats", at: 1, animated: false)
        
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.selectedSegmentIndex = 0
        
        segmented.backgroundColor = .white
        segmented.tintColor = .white
        segmented.selectedSegmentTintColor = .white
        
        segmented.layer.borderColor = UIColor.white.cgColor
        segmented.layer.borderWidth = 2
        segmented.layer.cornerRadius = 0
        
        segmented.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .normal)
        
        segmented.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: .selected)

        return segmented
    }()
    
    lazy var aboutView: PokemonDetailAboutView = {
        let view = PokemonDetailAboutView()
        
        return view
    }()
    
    lazy var statusView: PokemonDetailStatusView = {
        let view = PokemonDetailStatusView()
        view.alpha = 0
        
        return view
    }()
    
    lazy var  buttonBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    // MARK: - INITIALIZER
    init() {
        super.init(frame: .zero)
        self.configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CONFIG VIEW
    func configView() {
        self.addSubview(pokemonLabel)
        self.addSubview(pokedexNumberLabel)
        self.addSubview(primaryType)
        self.addSubview(secondaryType)
        self.addSubview(pokeballImageView)
        self.addSubview(pokemonImageView)
        self.addSubview(containerView)
        containerView.addSubview(segmentedControl)
        containerView.addSubview(aboutView)
        containerView.addSubview(statusView)
        containerView.addSubview(buttonBar)
        
        NSLayoutConstraint.activate([
            pokemonLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            pokemonLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            pokedexNumberLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            pokedexNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            primaryType.topAnchor.constraint(equalTo: pokemonLabel.bottomAnchor, constant: 5),
            primaryType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            secondaryType.topAnchor.constraint(equalTo: pokemonLabel.bottomAnchor, constant: 5),
            secondaryType.leadingAnchor.constraint(equalTo: primaryType.trailingAnchor, constant: 5),
            
            pokeballImageView.topAnchor.constraint(equalTo: primaryType.bottomAnchor, constant: 40),
            pokeballImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            pokeballImageView.heightAnchor.constraint(equalToConstant: 160),
            pokeballImageView.widthAnchor.constraint(equalToConstant: 160),
            
            pokemonImageView.topAnchor.constraint(equalTo: primaryType.bottomAnchor, constant: 40),
            pokemonImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 160),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 160),
            
            containerView.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: -30),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            segmentedControl.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: pokemonImageView.bottomAnchor, constant: 20),
            
            aboutView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            aboutView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            aboutView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            aboutView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            
            statusView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            statusView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            statusView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            statusView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            
            buttonBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            buttonBar.heightAnchor.constraint(equalToConstant: 5),
            buttonBar.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor),
            buttonBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments))
            
        ])
    }
}
