//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 24/07/22.
//

import UIKit

class PokemonDetailViewController : UIViewController {
    
    private let detailView: PokemonDetailView = PokemonDetailView()
    private let detailModel: PokemonDetailViewModel
    
    init(with pokemonDetail: PokemonDetail) {
        self.detailModel = PokemonDetailViewModel(with: pokemonDetail)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = detailView
        
        self.configView()
        self.configNavigationBar()
        
        self.fetchPokemonDetail()
    }
}

private extension PokemonDetailViewController {
    
    func fetchPokemonDetail() {
        self.detailModel.fetchPokemonDetail {
            self.detailView.configView(with: self.detailModel)
        }
    }
    
    func configView() {
        self.detailView.segmentedControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
    }
    
    func configNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward")?.withTintColor(.white, renderingMode: .alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(backNavigation))
    }
    
    @objc
    func backNavigation() {
        self.navigationController?.popViewController(animated: true)
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
