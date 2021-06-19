//
//  TitleLabel.swift
//  FetchRewardsProject
//
//  Created by Brian Kim on 6/19/21.
//

import UIKit

class TitleLabel: UILabel {

    init(_ text: String?) {
        super.init(frame: .zero)
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
