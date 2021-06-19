//
//  EventsDetailViewController.swift
//  FetchRewardsProject
//
//  Created by Brian Kim on 6/19/21.
//

import Foundation

import UIKit

class ExpandedEventController: UIViewController {
    
    //MARK: Properties
    
    var event: Event? = nil
    
    private let favoriteButtonSize: CGFloat = 50
    
    var favoriteButton: LikeButton!
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "cell"
        edgesForExtendedLayout = []
        configureGradientLayer()
        
        guard let event = event else {
            self.dismiss(animated: false)
            return
        }
        
        
        favoriteButton = LikeButton(isFavorite: FavoriteManager.isLiked(event.id),
                                            size: favoriteButtonSize)
        favoriteButton.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
        FavoriteManager.subscribe(event.id, favoriteButton)
        
        let imageView = UIImageView()
        imageView.setNetworkImage(event.imageUrl)
        imageView.contentMode = .scaleAspectFill
        
        let titleLabel = TitleLabel(event.short_title)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 16, weight: .heavy)
        titleLabel.textColor = .white
        
        let dateLabel = SubTextLabel(event.eventDate)
        dateLabel.numberOfLines = 0
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.textColor = .black
        dateLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        dateLabel.textColor = .white
        
        
        view.addSubview(favoriteButton)
        favoriteButton.anchor(top: view.topAnchor, right: view.rightAnchor)
        
        view.addSubview(imageView)
        imageView.fillSuperview()
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.topAnchor,left: view.leftAnchor, paddingTop: 400, paddingLeft: 16)
        
        view.addSubview(dateLabel)
        dateLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 16, paddingLeft: 16)
        view.bringSubviewToFront(favoriteButton)
        view.bringSubviewToFront(dateLabel)
        view.bringSubviewToFront(titleLabel)
        
        
        
    }
    
    //MARK: Actions
    
    deinit {
        guard let event = event else { return }
        FavoriteManager.unsubscribe(event.id, favoriteButton)
    }
    
    @objc func didTapFavoriteButton() {
        guard let event = event else { return }
        FavoriteManager.pressedFavorite(for: event.id)
    }
    
    //MARK: Helpers

}
