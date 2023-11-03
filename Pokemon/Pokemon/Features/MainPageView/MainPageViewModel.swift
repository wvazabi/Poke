//
//  MainPageViewModel.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import Foundation

protocol MainPageViewModelInterface {
    func viewDidLoad()
}

final class MainPageViewModel: MainPageViewModelInterface {
    
    private weak var view: MainPageViewInterface?
    var manager:  PokemonsFethable
    var poke: [Pokemon] = []

    init(view: MainPageViewInterface, manager: PokemonsFethable) {
        self.view = view
        self.manager = manager
    }
    func viewDidLoad() {
        view?.prepare()
    }

    func fetchPokemons() {
        manager.fetchPokemons { response in
            switch response {
                case .success(let success):
                    #warning("unforce check")
                    self.poke = success.results!
                self.view?.updateData()
                //self.view?.updateData(on: view?.filteredPokemons)
            
                case .failure(let failure):
                    print(failure)
            }
        }
    }

   
}
