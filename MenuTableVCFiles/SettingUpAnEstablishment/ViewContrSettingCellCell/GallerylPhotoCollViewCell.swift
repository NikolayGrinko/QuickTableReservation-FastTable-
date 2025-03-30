//
//  GalleryPhotoCollViewCell.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 17.10.2024.
//

import UIKit

// Photo model


// Custom UICollectionViewCell for displaying photo
class GalleryPhotoCollViewCell: UICollectionViewCell {
    
    let identifier = "GalleryPhotoCollViewCell"
    
    var imageViewGallery: UIImageView!
    var deleteButtonGallery: UIButton!
    var favoriteButtonGallery: UIButton!
    var favoriteIconGallery: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Image view to display the photo
        imageViewGallery = UIImageView(frame: .zero)
        imageViewGallery.translatesAutoresizingMaskIntoConstraints = false
        imageViewGallery.contentMode = .scaleToFill
        imageViewGallery.clipsToBounds = true
        imageViewGallery.layer.cornerRadius = 20
        imageViewGallery.frame.size.width = 20
        imageViewGallery.frame.size.height = 20
        imageViewGallery.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        contentView.addSubview(imageViewGallery)
        
        // Favorite button
        favoriteButtonGallery = UIButton(type: .system)
        favoriteButtonGallery.setTitle("★", for: .normal)
        favoriteButtonGallery.backgroundColor = .white
        favoriteButtonGallery.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favoriteButtonGallery)
        
        // Delete button
        deleteButtonGallery = UIButton(type: .system)
        deleteButtonGallery.setTitle("X", for: .normal)
        deleteButtonGallery.backgroundColor = .red
        deleteButtonGallery.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(deleteButtonGallery)
        
        // Favorite icon
        favoriteIconGallery = UIImageView(image: UIImage(systemName: "star.fill"))
        favoriteIconGallery.backgroundColor = .systemGray5
        favoriteIconGallery.translatesAutoresizingMaskIntoConstraints = false
       // favoriteIcon.layer.cornerRadius = 20
        favoriteIconGallery.isHidden = true
        contentView.addSubview(favoriteIconGallery)
        
        // Constraints
        NSLayoutConstraint.activate([
            imageViewGallery.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageViewGallery.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageViewGallery.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            imageView.heightAnchor.constraint(equalToConstant: 70),
//            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageViewGallery.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            favoriteButtonGallery.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            favoriteButtonGallery.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            favoriteButtonGallery.heightAnchor.constraint(equalToConstant: 30),
            favoriteButtonGallery.heightAnchor.constraint(equalToConstant: 30),
            
            deleteButtonGallery.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            deleteButtonGallery.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            deleteButtonGallery.heightAnchor.constraint(equalToConstant: 30),
            deleteButtonGallery.heightAnchor.constraint(equalToConstant: 30),
            
            favoriteIconGallery.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            favoriteIconGallery.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
