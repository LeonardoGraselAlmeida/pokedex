//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var viewModel = HomeViewModel()
    var homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        fetchData()
    }
    
    func fetchData() {
        let count = viewModel.pokemons.count + 1
        
        let url = URL(string: "https://api-pokemons-go.herokuapp.com/pokemon/all/\(count)/20")!
        
        URLSession.shared.fetchData(for: url) { (result: Result<[Pokemon], Error>) in
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
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
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
        if indexPath.row == viewModel.pokemons.count - 4 && viewModel.pokemons.count < 415 {
            fetchData()
        }
    }
}
