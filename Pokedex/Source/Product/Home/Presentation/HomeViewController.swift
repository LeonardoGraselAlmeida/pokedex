//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    var navigateToPokemonDetail: ((PokemonDetail) -> Void)?
    
    private var homeView: HomeView = HomeView()
    
    private var viewModel:HomeViewModel
    private var network: PokemonNetwork
    
    init(network: PokemonNetwork = PokemonNetwork()) {
        self.network = network
        self.viewModel = HomeViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = homeView
        self.homeView.collectionView.delegate = self
        self.homeView.collectionView.dataSource = self
        self.fetchPokemonList()
    }
}

extension HomeViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier,
                                                            for: indexPath) as? CustomCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        viewModel.setupCell(index: indexPath.row, cell: cell)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 2 - 22,
                      height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == viewModel.pokemons.count - 2 && viewModel.pokemons.count < 415 {
            fetchPokemonList()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonId = viewModel.getID(at: indexPath.row)
        self.fetchPokemonDetail(with: pokemonId)
    }
}

private extension HomeViewController {
    func fetchPokemonList() {
        let count = self.viewModel.pokemons.count + 1
        
        network.fetchPokemonList(from: count) { (result: Result<[PokemonModel], Error>) in
            switch result {
            case .success(let newPokemons):
                DispatchQueue.main.async {
                    self.viewModel.pokemons.append(contentsOf: newPokemons)
                    self.homeView.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPokemonDetail(with pokemonId: Int) {
        network.fetchPokemonDetail(from: pokemonId) { (result: Result<PokemonDetail, Error>) in
            switch result {
            case .success(let pokemonDetail):
                DispatchQueue.main.async {
                    self.navigateToPokemonDetail?(pokemonDetail)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
