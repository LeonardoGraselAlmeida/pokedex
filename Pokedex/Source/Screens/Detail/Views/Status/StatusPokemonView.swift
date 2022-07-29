//
//  StatusPokemonViewController.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 24/07/22.
//

import UIKit

class StatusPokemonView: UIView {
    
    lazy private var hpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "HP"
        return label
    }()
    
    lazy var hpValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy var hpProgress: UIProgressView = {
       var progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .systemRed
        return progress
    }()
    
    lazy private var attackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Attack"
        return label
    }()
    
    lazy var attackValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy var attackProgress: UIProgressView = {
        var progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .systemGreen
        return progress
    }()
    
    lazy private var defenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Defense"
        return label
    }()
    
    lazy var defenseValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy var defenseProgress: UIProgressView = {
        var progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .systemRed
        return progress
    }()
    
    lazy private var spAttackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Sp. Atk"
        return label
    }()
    
    lazy var spAttackValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy var spAttackProgress: UIProgressView = {
        var progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .systemGreen
        return progress
    }()
    
    lazy private var spDefenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Sp. Def"
        return label
    }()
    
    lazy var spDefenseValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy var spDefenseProgress: UIProgressView = {
        var progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .systemRed
        return progress
    }()
    
    lazy private var speedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Speed"
        return label
    }()
    
    lazy var speedProgress: UIProgressView = {
        var progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .systemGreen
        return progress
    }()
    
    lazy var speedValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy private var totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .gray
        label.text = "Total"
        return label
    }()
    
    lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        return label
    }()
    
    lazy var totalProgress: UIProgressView = {
        var progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .systemRed
        return progress
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
        
        self.addSubview(hpLabel)
        self.addSubview(attackLabel)
        self.addSubview(defenseLabel)
        self.addSubview(spAttackLabel)
        self.addSubview(spDefenseLabel)
        self.addSubview(speedLabel)
        self.addSubview(totalLabel)
        
        self.addSubview(hpValueLabel)
        self.addSubview(attackValueLabel)
        self.addSubview(defenseValueLabel)
        self.addSubview(spAttackValueLabel)
        self.addSubview(spDefenseValueLabel)
        self.addSubview(speedValueLabel)
        self.addSubview(totalValueLabel)
        
        self.addSubview(hpProgress)
        self.addSubview(attackProgress)
        self.addSubview(defenseProgress)
        self.addSubview(spAttackProgress)
        self.addSubview(spDefenseProgress)
        self.addSubview(speedProgress)
        self.addSubview(totalProgress)
        
        configContraints()
    }
    
    func configContraints() {
        NSLayoutConstraint.activate([
            hpLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            hpLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            hpLabel.widthAnchor.constraint(equalToConstant: 100),
            
            hpValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            hpValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            hpValueLabel.widthAnchor.constraint(equalToConstant: 40),
            
            hpProgress.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            hpProgress.leadingAnchor.constraint(equalTo: self.hpValueLabel.leadingAnchor, constant: 40),
            hpProgress.widthAnchor.constraint(equalToConstant: 160),
            
            attackLabel.topAnchor.constraint(equalTo: hpLabel.bottomAnchor, constant: 20),
            attackLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            attackLabel.widthAnchor.constraint(equalToConstant: 100),
            
            attackValueLabel.topAnchor.constraint(equalTo: hpLabel.bottomAnchor, constant: 20),
            attackValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            attackValueLabel.widthAnchor.constraint(equalToConstant: 40),
            
            attackProgress.topAnchor.constraint(equalTo: hpLabel.bottomAnchor, constant: 25),
            attackProgress.leadingAnchor.constraint(equalTo: self.attackValueLabel.leadingAnchor, constant: 40),
            attackProgress.widthAnchor.constraint(equalToConstant: 160),
            
            defenseLabel.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 20),
            defenseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            defenseLabel.widthAnchor.constraint(equalToConstant: 100),
            
            defenseValueLabel.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 20),
            defenseValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            defenseValueLabel.widthAnchor.constraint(equalToConstant: 40),
            
            defenseProgress.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 25),
            defenseProgress.leadingAnchor.constraint(equalTo: self.defenseValueLabel.leadingAnchor, constant: 40),
            defenseProgress.widthAnchor.constraint(equalToConstant: 160),
            
            spAttackLabel.topAnchor.constraint(equalTo: defenseLabel.bottomAnchor, constant: 20),
            spAttackLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            spAttackLabel.widthAnchor.constraint(equalToConstant: 100),
            
            spAttackValueLabel.topAnchor.constraint(equalTo: defenseLabel.bottomAnchor, constant: 20),
            spAttackValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            spAttackValueLabel.widthAnchor.constraint(equalToConstant: 40),
            
            spAttackProgress.topAnchor.constraint(equalTo:defenseLabel.bottomAnchor, constant: 25),
            spAttackProgress.leadingAnchor.constraint(equalTo: self.spAttackValueLabel.leadingAnchor, constant: 40),
            spAttackProgress.widthAnchor.constraint(equalToConstant: 160),
            
            spDefenseLabel.topAnchor.constraint(equalTo: spAttackLabel.bottomAnchor, constant: 20),
            spDefenseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            spDefenseLabel.widthAnchor.constraint(equalToConstant: 100),
            
            spDefenseValueLabel.topAnchor.constraint(equalTo: spAttackLabel.bottomAnchor, constant: 20),
            spDefenseValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            spDefenseValueLabel.widthAnchor.constraint(equalToConstant: 40),
            
            spDefenseProgress.topAnchor.constraint(equalTo: spAttackLabel.bottomAnchor, constant: 25),
            spDefenseProgress.leadingAnchor.constraint(equalTo: self.spDefenseValueLabel.leadingAnchor, constant: 40),
            spDefenseProgress.widthAnchor.constraint(equalToConstant: 160),
            
            speedLabel.topAnchor.constraint(equalTo: spDefenseLabel.bottomAnchor, constant: 20),
            speedLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            speedLabel.widthAnchor.constraint(equalToConstant: 100),
            
            speedValueLabel.topAnchor.constraint(equalTo: spDefenseLabel.bottomAnchor, constant: 20),
            speedValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            speedValueLabel.widthAnchor.constraint(equalToConstant: 40),
            
            speedProgress.topAnchor.constraint(equalTo: spDefenseLabel.bottomAnchor, constant: 25),
            speedProgress.leadingAnchor.constraint(equalTo: self.speedValueLabel.leadingAnchor, constant: 40),
            speedProgress.widthAnchor.constraint(equalToConstant: 160),
            
            totalLabel.topAnchor.constraint(equalTo: speedLabel.bottomAnchor, constant: 20),
            totalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            totalLabel.widthAnchor.constraint(equalToConstant: 100),
            
            totalValueLabel.topAnchor.constraint(equalTo: speedLabel.bottomAnchor, constant: 20),
            totalValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            totalValueLabel.widthAnchor.constraint(equalToConstant: 40),
            
            totalProgress.topAnchor.constraint(equalTo: speedLabel.bottomAnchor, constant: 25),
            totalProgress.leadingAnchor.constraint(equalTo: self.totalValueLabel.leadingAnchor, constant: 40),
            totalProgress.widthAnchor.constraint(equalToConstant: 160)
        ])
    }
}
