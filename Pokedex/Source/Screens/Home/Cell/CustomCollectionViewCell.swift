//
//  CustomTableViewCell.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CustomCollectionViewCell"
    
    var cardView: UICardView = {
        let card = UICardView()
        return card
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(cardView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
