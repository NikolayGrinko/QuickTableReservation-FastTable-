//
//  PhotoCell.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 17.10.2024.
//
import UIKit


// Ячейка коллекции
class PhotoCell: UICollectionViewCell {
    var deleteAction: (() -> Void)?
    var favoriteAction: (() -> Void)?
    var addPhotoAction: (() -> Void)?
    
    private let imageView = UIImageView()
    private let deleteButton = UIButton(type: .system)
    private let favoriteButton = UIButton(type: .system)
    private let addButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(deleteButton)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(addButton)
        
        imageView.frame = CGRect(x: 5, y: 5, width: 100, height: 100)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        deleteButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        deleteButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        deleteButton.tintColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        deleteButton.layer.cornerRadius = 10
        deleteButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        favoriteButton.frame = CGRect(x: 80, y: 0, width: 20, height: 20)
        favoriteButton.tintColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        favoriteButton.layer.cornerRadius = 10
        favoriteButton.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        favoriteButton.addTarget(self, action: #selector(favoriteTapped), for: .touchUpInside)
        
        addButton.setImage(UIImage(systemName: "camera"), for: .normal)
        addButton.frame = CGRect(x: 5, y: 5, width: 100, height: 100)
        addButton.layer.cornerRadius = 10
        addButton.clipsToBounds = true
        addButton.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        addButton.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        addButton.addTarget(self, action: #selector(addPhotoTapped), for: .touchUpInside)
        
        // Layout code...
    }
    
    func configure(with photo: Photo, isEditing: Bool) {
        imageView.image = photo.image
        favoriteButton.isHidden = !isEditing
        deleteButton.isHidden = !isEditing
        addButton.isHidden = true
    }
    
    func configureForAddPhoto() {
        imageView.image = nil
        favoriteButton.isHidden = true
        deleteButton.isHidden = true
        addButton.isHidden = false
    }
    
    @objc private func deleteTapped() {
        deleteAction?()
    }
    
    @objc private func favoriteTapped() {
        favoriteAction?()
    }
    
    @objc private func addPhotoTapped() {
        addPhotoAction?()
    }
}




