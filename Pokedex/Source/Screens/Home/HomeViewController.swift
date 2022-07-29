//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    var navigateToPokemonDetail: ((PokemonDetail) -> Void)?
    
    var viewModel = HomeViewModel()
    var homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        fetchData()
    }
    
    func fetchData() {
        viewModel.fetchData {
            DispatchQueue.main.async {
                self.homeView.collectionView.reloadData()
            }
        }
    }
}

extension HomeViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
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
            fetchData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonId = viewModel.getID(at: indexPath.row)
        self.fetchPokemonDetail(with: pokemonId)
    }
    
    func fetchPokemonDetail(with pokemonId: Int) {
        
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)")!
        
        URLSession.shared.fetchData(for: url) { (result: Result<PokemonDetail, Error>) in
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
