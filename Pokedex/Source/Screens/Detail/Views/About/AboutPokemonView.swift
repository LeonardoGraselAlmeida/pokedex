//
//  AboutPokemonView.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 24/07/22.
//

import UIKit

class AboutPokemonView: UIView {
    
    lazy private var speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Species"
        return label
    }()
    
    lazy var speciesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy private var heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Height"
        return label
    }()
    
    lazy var heightValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy private var weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Weight"
        return label
    }()
    
    lazy var weightValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy private var abilitiesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Abilities"
        return label
    }()
    
    lazy var abilitiesValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(speciesLabel)
        self.addSubview(heightLabel)
        self.addSubview(weightLabel)
        self.addSubview(abilitiesLabel)
        
        self.addSubview(speciesValueLabel)
        self.addSubview(heightValueLabel)
        self.addSubview(weightValueLabel)
        self.addSubview(abilitiesValueLabel)
        
        configContraints()
    }
    
    func configContraints() {
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            speciesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            speciesLabel.widthAnchor.constraint(equalToConstant: 100),
            
            speciesValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            speciesValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            
            heightLabel.topAnchor.constraint(equalTo: speciesLabel.topAnchor, constant: 40),
            heightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            heightLabel.widthAnchor.constraint(equalToConstant: 100),
            
            heightValueLabel.topAnchor.constraint(equalTo: speciesLabel.topAnchor, constant: 40),
            heightValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            
            weightLabel.topAnchor.constraint(equalTo: heightLabel.topAnchor, constant: 40),
            weightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            weightLabel.widthAnchor.constraint(equalToConstant: 100),
            
            weightValueLabel.topAnchor.constraint(equalTo: heightLabel.topAnchor, constant: 40),
            weightValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            
            abilitiesLabel.topAnchor.constraint(equalTo: weightLabel.topAnchor, constant: 40),
            abilitiesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            abilitiesLabel.widthAnchor.constraint(equalToConstant: 100),
            
            abilitiesValueLabel.topAnchor.constraint(equalTo: weightLabel.topAnchor, constant: 40),
            abilitiesValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120)
        ])
    }
    
}
