//
//  DetailCoordinator.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 24/07/22.
//

import UIKit

class PokemonDetailCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let pokemonDetail = PokemonDetail(id: 0, baseExperience: 0, height: 0, weight: 0, abilities: [], name: "", order: 0, sprities: nil, stats: [], types: [], species: nil)
        
        let viewController = PokemonDetailViewController(with: pokemonDetail)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
