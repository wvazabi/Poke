//
//  DetailView.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import UIKit

protocol DetailViewInterface: AnyObject {
    func prepare()
}

final class DetailView: UIViewController {
    
    private lazy var viewModel = DetailViewModel(view: self,manager: NetworkManager())

    //MARK: - Components
    let contentView : UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        return contentView
    }()

    let pokeName : UILabel = {
        let pokeName = UILabel()
        pokeName.translatesAutoresizingMaskIntoConstraints = false
        pokeName.text = "Bulbasour"
        pokeName.textColor = .white
        pokeName.font = UIFont.boldSystemFont(ofSize: 22)
        return pokeName
    }()

    let pokeImage : UIImageView = {
        let pokeImage = UIImageView()
        pokeImage.translatesAutoresizingMaskIntoConstraints = false
        pokeImage.image = UIImage(named: "bulbasour")
        return pokeImage
    }()

    let aboutLabel : UILabel = {
        let aboutLabel = UILabel()
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.textColor = UIColor(named: "bulbasourColor")
        aboutLabel.text = "About"
        aboutLabel.font = UIFont.boldSystemFont(ofSize: 18)
        aboutLabel.textAlignment = .center
        return aboutLabel
    }()
    //MARK: - Life Cycle

    override func viewDidLoad() {
        viewModel.viewDidLoad()
        super.viewDidLoad()

    }
    
}

//MARK: - DetailViewViewInterface

extension DetailView: DetailViewInterface { 

  func prepare() {

      view.backgroundColor = UIColor(named: "bulbasourColor")

      view.addSubview(contentView)
      view.addSubview(pokeName)
      view.addSubview(pokeImage)
      view.addSubview(aboutLabel)


      NSLayoutConstraint.activate([
        pokeName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        pokeName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        pokeName.widthAnchor.constraint(equalToConstant: 200),

        pokeImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        pokeImage.topAnchor.constraint(equalTo: pokeName.bottomAnchor, constant: 80),
        pokeImage.bottomAnchor.constraint(equalTo: pokeImage.bottomAnchor),
        pokeImage.widthAnchor.constraint(equalToConstant: 200),
        pokeImage.heightAnchor.constraint(equalToConstant: 200),


        aboutLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        aboutLabel.topAnchor.constraint(equalTo: pokeImage.bottomAnchor, constant: 70),
        aboutLabel.widthAnchor.constraint(equalToConstant: 100),

        contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

      ])
  }

}
