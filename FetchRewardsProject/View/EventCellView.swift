//
//  EventCellView.swift
//  FetchRewardsProject
//
//  Created by Brian Kim on 6/19/21.
//



import UIKit
import SnapKit

class EventCellView: UITableViewCell {
    
    
   
    
    let event: Event
    var favoriteButton: LikeButton!
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let descriptionLabel = UILabel()
    
    
    init(_ event: Event) {
        self.event = event
        super.init(style: .default, reuseIdentifier: "Cell")
        
        backgroundColor = .white
        
        
        let imageView = UIImageView()
        imageView.setNetworkImage(event.imageUrl)
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.setDimensions(height: 150, width: 150)
        
        
        addSubview(imageView)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor,
                         paddingTop: 16, paddingLeft: 16, paddingBottom: 16)
        
        let favoriteButtonSize: CGFloat = 25
        favoriteButton = LikeButton(isFavorite: FavoriteManager.isLiked(event.id),
                                        size: favoriteButtonSize,
                                        hideIfUnfavorited: true)
        
        favoriteButton.isUserInteractionEnabled = false
        FavoriteManager.subscribe(event.id, favoriteButton)
        
        addSubview(favoriteButton)
        favoriteButton.anchor(top: topAnchor, right: rightAnchor)
        
        
        let titleLabel = TitleLabel(event.short_title ?? event.title)
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: imageView.rightAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 60)
        
        
        let dateLabel = SubTextLabel(event.eventDate)
        dateLabel.numberOfLines = 0
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.textColor = .black
        dateLabel.font = .systemFont(ofSize: 18, weight: .ultraLight)
       
        
        addSubview(dateLabel)
        dateLabel.anchor(top: titleLabel.bottomAnchor, left: imageView.rightAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 16, paddingRight: 60)
        
        
        let descriptionLabel = SubTextLabel(event.description)
        descriptionLabel.numberOfLines = 2
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.textColor = .black
        descriptionLabel.font = .systemFont(ofSize: 17, weight: .light)
        
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: dateLabel.bottomAnchor, left: imageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 60)
        
        
    }
    
    deinit {
        FavoriteManager.unsubscribe(event.id, favoriteButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
