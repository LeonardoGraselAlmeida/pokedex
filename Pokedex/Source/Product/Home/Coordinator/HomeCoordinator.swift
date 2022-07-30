//
//  HomeCoordinator.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.navigateToPokemonDetail = self.navigateToPokemonDetail
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToPokemonDetail(with pokemonDetail: PokemonDetail) {
        let viewController = PokemonDetailViewController(with: pokemonDetail)
        navigationController.pushViewController(viewController, animated: true)
    }
}