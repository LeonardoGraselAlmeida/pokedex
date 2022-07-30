//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 24/07/22.
//

import UIKit

class PokemonDetailViewController : UIViewController {
    
    let detailView: PokemonDetailView = PokemonDetailView()
    let detailModel: PokemonDetailViewModel
    
    init(with pokemonDetail: PokemonDetail) {
        self.detailModel = PokemonDetailViewModel(with: pokemonDetail)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = detailView
        configNavigationBar()
        configView()
    }
}

extension PokemonDetailViewController {
    func configView() {
        let pokemonName = detailModel.getPokemonName()
        let pokedexNumber = detailModel.getPokedexNumber()
        let primaryType = detailModel.getPrimaryType()
        let secondaryType = detailModel.getSecondaryType()
        let urlImagePokemon = detailModel.getUrlImagePokemon()
        let specie = detailModel.getSpecie()
        let height = detailModel.getHeight()
        let weight = detailModel.getWeight()
        let abilities = detailModel.getAbilities()
        let hp = detailModel.getHpStats()
        let attack = detailModel.getAttackStats()
        let defense = detailModel.getDefenseStats()
        let spAttack = detailModel.getSpAttackStats()
        let spDefense = detailModel.getSpDefenseStats()
        let speed = detailModel.getSpeedStats()
        let total = detailModel.getTotalStats()
        
        self.detailView.backgroundColor = BaseColor.shared.getColor(type: primaryType)
        self.detailView.pokemonLabel.text = pokemonName
        self.detailView.pokedexNumberLabel.text = pokedexNumber
        self.detailView.primaryType.tagText.text = primaryType.capitalized
        self.detailView.secondaryType.tagText.text = secondaryType.capitalized
        self.detailView.secondaryType.isHidden = secondaryType.isEmpty
        self.detailView.pokemonImageView.loadFrom(URLAddress: urlImagePokemon) {
            self.detailView.pokemonImageView.activityView.stopAnimating()
        }
        self.detailView.aboutView.speciesValueLabel.text = specie
        self.detailView.aboutView.heightValueLabel.text = height
        self.detailView.aboutView.weightValueLabel.text = weight
        self.detailView.aboutView.abilitiesValueLabel.text = abilities
        
        self.detailView.statusView.hpValueLabel.text = String(hp)
        self.detailView.statusView.attackValueLabel.text = String(attack)
        self.detailView.statusView.defenseValueLabel.text = String(defense)
        self.detailView.statusView.spAttackValueLabel.text = String(spAttack)
        self.detailView.statusView.spDefenseValueLabel.text = String(spDefense)
        self.detailView.statusView.speedValueLabel.text = String(speed)
        self.detailView.statusView.totalValueLabel.text = String(total)
        
        self.detailView.statusView.hpProgress.setProgress(Float(hp)/100, animated: false)
        self.detailView.statusView.attackProgress.setProgress(Float(attack)/100, animated: false)
        self.detailView.statusView.defenseProgress.setProgress(Float(defense)/100, animated: false)
        self.detailView.statusView.spAttackProgress.setProgress(Float(spAttack)/100, animated: false)
        self.detailView.statusView.spDefenseProgress.setProgress(Float(spDefense)/100, animated: false)
        self.detailView.statusView.speedProgress.setProgress(Float(speed)/100, animated: false)
        self.detailView.statusView.totalProgress.setProgress(Float(total)/600, animated: false)
        
        self.detailView.segmentedControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
    }
    
    func configNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(backNavigation))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "heart")?.withTintColor(.white, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(addFavorite))
    }
    
    @objc
    func backNavigation() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func addFavorite() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "heart.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: nil)
    }
    
    @objc func segmentedValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.detailView.aboutView.alpha = 1
                self.detailView.statusView.alpha = 0
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.detailView.statusView.alpha = 1
                self.detailView.aboutView.alpha = 0
            })
        }
        UIView.animate(withDuration: 0.05, animations: {
            self.detailView.buttonBar.frame.origin.x = (self.detailView.segmentedControl.frame.width / CGFloat(self.detailView.segmentedControl.numberOfSegments))
            * CGFloat(self.detailView.segmentedControl.selectedSegmentIndex) + self.detailView.segmentedControl.frame.minX
        })
    }
}
