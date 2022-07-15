//
//  UITagView.swift
//  Pokedex
//
//  Created by Leonardo Almeida on 01/07/22.
//

import UIKit

class UITagView: UIView {
    
    lazy var tagText: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Poppins-Bold", size: 10)
        label.text = "grass"
        label.textColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCardView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        layer.cornerRadius = 8
        clipsToBounds = true
            
        setConstraints()
    }
    
    func setConstraints() {
        addSubview(tagText)
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 20),
            widthAnchor.constraint(equalToConstant: 60),
            
            tagText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tagText.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            tagText.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
