//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class PokemonListViewController: UIViewController {
    var navigateToPokemonDetail: ((PokemonListModel) -> Void)?
    
    private var pokemonListView: PokemonListView = PokemonListView()
    private var viewModel: PokemonListViewModel = PokemonListViewModel()
    
    override func loadView() {
        self.view = pokemonListView
        self.pokemonListView.collectionView.delegate = self
        self.pokemonListView.collectionView.dataSource = self
        self.fetchPokemonList()
    }
}

extension PokemonListViewController:  UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.pokemonsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                                            withReuseIdentifier: CustomCollectionViewCell.identifier,
                                            for: indexPath) as? CustomCollectionViewCell
        else { return UICollectionViewCell() }
        
        let pokemon = viewModel.getPokemonList(at: indexPath.row)
        let cellViewModel = CustomCollectionCellViewModel(pokemonList: pokemon)
        cell.setupCell(with: cellViewModel)
        
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
        let isAlmostEndList = indexPath.row == viewModel.pokemonsCount - 2
        if  isAlmostEndList {
            self.fetchPokemonList()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonList = viewModel.getPokemonList(at: indexPath.row)
        self.navigateToPokemonDetail?(pokemonList)
    }
}

private extension PokemonListViewController {
    func fetchPokemonList() {
        self.viewModel.fetchPokemonList {
            self.pokemonListView.collectionView.reloadData()
        }
    }

}
