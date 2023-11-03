//
//  PokeCell.swift
//  Pokemon
//
//  Created by Emincan Antalyalı on 3.11.2023.
//

import UIKit

class PokeCell: UICollectionViewCell {

    private enum ViewMetrics {
        static let pokeCellFontSize: CGFloat = 16.0
        static let directionalMargins = NSDirectionalEdgeInsets(top: 8.0, leading: 8.0, bottom: 8.0, trailing: 8.0)
    }

    static let reuseID = "FollowerCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let pokeNameLabel   = pokeTitleLabel(textAlignment: .center, fontSize: 16)


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(follower: Pokemon) {
        pokeNameLabel.text = follower.name
        avatarImageView.image = UIImage(named: "bulbasour.png")
    }

    private func configure() {
        addSubview(avatarImageView)
        addSubview(pokeNameLabel)


        contentView.directionalLayoutMargins = ViewMetrics.directionalMargins

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),

            pokeNameLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: avatarImageView.bottomAnchor, multiplier: 1.0),
            pokeNameLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            pokeNameLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            pokeNameLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
        ])
    }
}
