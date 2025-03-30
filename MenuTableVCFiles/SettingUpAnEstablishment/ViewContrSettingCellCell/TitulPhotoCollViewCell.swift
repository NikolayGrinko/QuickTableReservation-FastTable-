//
//  TitulPhotoCollViewCell.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 17.10.2024.
//

import UIKit

// Photo model


// Custom UICollectionViewCell for displaying photo
class TitulPhotoCollViewCell: UICollectionViewCell {
    
    let identifier = "TitulPhotoCollViewCell"
    
    var imageView: UIImageView!
    var deleteButton: UIButton!
    var favoriteButton: UIButton!
    var favoriteIcon: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Image view to display the photo
        imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.frame.size.width = 20
        imageView.frame.size.height = 20
        imageView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        contentView.addSubview(imageView)
        
        // Favorite button
        favoriteButton = UIButton(type: .system)
        favoriteButton.setTitle("★", for: .normal)
        favoriteButton.layer.cornerRadius = 10
        favoriteButton.backgroundColor = .white
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favoriteButton)
        
        // Delete button
        deleteButton = UIButton(type: .system)
        deleteButton.setTitle("X", for: .normal)
        deleteButton.backgroundColor = .red
        deleteButton.layer.cornerRadius = 10
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(deleteButton)
        
        // Favorite icon
        favoriteIcon = UIImageView(image: UIImage(systemName: "star.fill"))
        favoriteIcon.backgroundColor = .systemGray5
        favoriteIcon.translatesAutoresizingMaskIntoConstraints = false
       // favoriteIcon.layer.cornerRadius = 20
        favoriteIcon.isHidden = true
        contentView.addSubview(favoriteIcon)
        
        // Constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: 70),
//            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            deleteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
            deleteButton.heightAnchor.constraint(equalToConstant: 30),
            
            favoriteIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            favoriteIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
