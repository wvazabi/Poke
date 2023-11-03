//
//  ViewController.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import UIKit

class ViewController: UIViewController {

    var viewModel = ViewModel(manager: NetworkManager())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        viewModel.fetchPokemons()
        viewModel.queryPokemon()
    }


}


final class ViewModel {
    var manager: (PokemonQueryable & PokemonsFethable)
    var pokemonArray: PokemonsResponse? = nil

    init(manager: (PokemonQueryable & PokemonsFethable)) {
        self.manager = manager
    }

    func fetchPokemons() {
        manager.fetchPokemons { response in
            switch response {
                case .success(let success):
                    self.pokemonArray = success
                    print(success)
                case .failure(let failure):
                    print(failure)
            }
        }
    }

    func queryPokemon() {
        manager.queryPokemon("charizard") { response in
            switch response {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
            }
        }
    }
}
