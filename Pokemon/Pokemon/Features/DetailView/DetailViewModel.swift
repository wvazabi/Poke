//
//  DetailViewModel.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import Foundation

protocol DetailViewModelInterface {
    func viewDidLoad()
}

final class DetailViewModel: DetailViewModelInterface {
    
    private weak var view: DetailViewInterface?
    private var manager: PokemonQueryable

    init(view: DetailViewInterface, manager: PokemonQueryable) {
        self.view = view
        self.manager = manager
    }
    func viewDidLoad() {
        view?.prepare()
    }


    func queryPokemon(pokemonName: String) {
        manager.queryPokemon(pokemonName) { response in
            switch response {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
            }
        }
    }
}
