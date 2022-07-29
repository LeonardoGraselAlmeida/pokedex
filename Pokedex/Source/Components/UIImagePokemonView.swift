//
//  UIImagePokemonView.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 02/07/22.
//

import UIKit

class UIImagePokemonView: UIImageView {
    
    lazy var activityView: UIActivityIndicatorView = {
       let activityView = UIActivityIndicatorView()
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.color = .gray
        
        return activityView
    }()
    
    var url: String {
        willSet {
            activityView.startAnimating()
        }
    }
    
    init(frame: CGRect, pokemonID: Int) {
        self.url = ""
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        
        activityView.startAnimating()
        loadFrom(URLAddress: url) {
            self.activityView.stopAnimating()
        }

        addSubview(activityView)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            activityView.topAnchor.constraint(equalTo: self.topAnchor),
            activityView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            activityView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            activityView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
            
    }
}
