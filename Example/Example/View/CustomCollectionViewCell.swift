//
//  CustomCollectionViewCell.swift
//  Example
//
//  Created by Harsh Verma on 11/11/23.
//  Copyright © 2023 Unsplash. All rights reserved.
//
import UIKit
class CustomCollectionViewCell: UICollectionViewCell {
    
    // Cell registeration id
    static let reuseIdentifier = "CustomCell"
    
    // Image view
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // Description label
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    // Override initializer to set up the view hierarchy
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add subviews and set up constraints
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Image view constraints
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8), 
            
            // Description label constraints
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    // Override required initializer for storyboard use
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configure cell with image and description
    func configure(with imageURL: URL?, description: String) {
        imageView.sd_setImage(with: imageURL, completed: nil)
        descriptionLabel.text = description
    }
}

