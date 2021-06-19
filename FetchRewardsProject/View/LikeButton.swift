//
//  LikeButton.swift
//  FetchRewardsProject
//
//  Created by Brian Kim on 6/19/21.
//



import UIKit
import AwesomeEnum

class LikeButton: UIButton {
    
    var hideIfUnLiked: Bool
    var size: CGFloat
    var isLiked: Bool {
        didSet {
            reloadHeartIcon()
        }
    }
    
    var heartImageView = UIImageView()
    
    init(isFavorite: Bool, size: CGFloat, hideIfUnfavorited: Bool = false) {
        self.hideIfUnLiked = hideIfUnfavorited
        self.isLiked = isFavorite
        self.size = size
        super.init(frame: .zero)
        
        addSubview(heartImageView)
        heartImageView.anchor(top: topAnchor, right: rightAnchor, paddingTop: 16, paddingRight: 16)
        
        reloadHeartIcon()
    }
    
    private func reloadHeartIcon() {
        
            let solid = Awesome.Solid.heart.asImage(size: size,
                                                     color: .red,
                                                     backgroundColor: .clear)
        
            let hollow = Awesome.Regular.heart.asImage(size: size,
                                                      color: hideIfUnLiked ? .clear : .red,
                                                     backgroundColor: .clear)
        
        heartImageView.image = isLiked ? solid : hollow
        self.accessibilityIdentifier = isLiked ? "solidHeart" : "hollowHeart"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: FavoriteObserver
extension LikeButton: FavoriteObserver {
    
    var uuid: String {
        return UUID().uuidString
    }
    
    func favoriteStatusDidChange(_ isFavorite: Bool) {
        self.isLiked = isFavorite
    }
    
}
