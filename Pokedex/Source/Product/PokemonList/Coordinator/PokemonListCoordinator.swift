//
//  HomeCoordinator.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class PokemonListCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = PokemonListViewController()
        viewController.navigateToPokemonDetail = self.navigateToPokemonDetail
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToPokemonDetail(with pokemonList: PokemonListModel) {
        let pokemonDetail = PokemonDetail(id: pokemonList.id, baseExperience: 0, height: 0, weight: 0,
                                          abilities: [], name: "", order: 0, sprities: nil, stats: [],
                                          types: [Types.init(slot: 0, type: .init(name: pokemonList.type1, url: ""))],
                                          species: nil)
        let viewController = PokemonDetailViewController(with: pokemonDetail)
        navigationController.pushViewController(viewController, animated: true)
    }
}
