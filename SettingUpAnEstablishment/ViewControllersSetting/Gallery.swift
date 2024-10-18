//
//  Gallery.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 19.10.2024.
//

import Foundation
import UIKit

class Gallery: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var isEditMode = false
    var photos: [PhotosOne] = []
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            let newPhotoG = PhotosOne(image: image, isFavorite: false)
            photos.append(newPhotoG)
            //collectionViewTitul.reloadData()
            collectionViewGallery.reloadData()
            saveGalleryButton.isHidden = false // Show save button when a new photo is added
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    let containerViewGallery: UIView = {
        let containerView = UIView()
        containerView.frame = CGRect(x: 10, y: 1450, width: 380, height: 400)
        containerView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        containerView.layer.cornerRadius = 10
        return containerView
    }()
    
    let nameLabelGallery: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Галерея"
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.frame = CGRect(x: 5, y: 10, width: 200, height: 20)
        return nameLabel
    }()
    
    let saveSizeGalleryLabel: UILabel = {
        let saveSizeLabel = UILabel()
        saveSizeLabel.text = "От 1 до 10 фото в формате JPG,JPGE"
        saveSizeLabel.font = .systemFont(ofSize: 12, weight: .regular)
        saveSizeLabel.textColor = .systemGray
        saveSizeLabel.frame = CGRect(x: 5, y: 35, width: 230, height: 20)
        return saveSizeLabel
    }()
    
    // Initialize collectionView
    var collectionViewGallery: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        var collectionViewTitul2 = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionViewTitul2.frame = CGRect(x: 5, y: 70, width: 360, height: 250)
        collectionViewTitul2.backgroundColor = #colorLiteral(red: 0.9490190148, green: 0.9490202069, blue: 0.9748199582, alpha: 1)
        collectionViewTitul2.register(GalleryPhotoCollViewCell.self, forCellWithReuseIdentifier: "GalleryPhotoCollViewCell")
        return collectionViewTitul2
    }()
    //Add button for adding photos (initially in the first cell)
    lazy var addGalleryButton: UIButton = {
        var addButton = UIButton(type: .custom)
        addButton.setImage(UIImage(systemName: "camera"), for: .normal)
        addButton.frame = CGRect(x: 5, y: 5, width: 100, height: 100)
        addButton.tintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        addButton.addTarget(self, action: #selector(addPhotoButtonGalleryTapped), for: .touchUpInside)
        return addButton
    }()
    
    // Save button (hidden initially)
    lazy var saveGalleryButton: UIButton = {
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = #colorLiteral(red: 0.8862745166, green: 0.8862745166, blue: 0.8862745166, alpha: 1)
        saveButton.tintColor = .black
        saveButton.layer.cornerRadius = 10
        saveButton.frame = CGRect(x: 10, y: 350, width: 350, height: 40)
        saveButton.isHidden = true
        saveButton.addTarget(self, action: #selector(saveButtonGalleryTapped), for: .touchUpInside)
        return saveButton
    }()
    
    // Edit Mode button
    lazy var editModeGalleryButton: UIButton = {
        editModeGalleryButton = UIButton(type: .system)
        editModeGalleryButton.backgroundColor = #colorLiteral(red: 0.9995579123, green: 0.8042607903, blue: 0.82557863, alpha: 1)
        editModeGalleryButton.tintColor = .red
        editModeGalleryButton.layer.cornerRadius = 5
        editModeGalleryButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editModeGalleryButton.frame = CGRect(x: 340, y: 20, width: 30, height: 30)
        editModeGalleryButton.addTarget(self, action: #selector(toggleEditGalleryMode), for: .touchUpInside)
        return editModeGalleryButton
    }()
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
        
        //addSubview(containerViewGallery)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerViewGallery)
        containerViewGallery.addSubview(nameLabelGallery)
        containerViewGallery.addSubview(saveSizeGalleryLabel)
        containerViewGallery.addSubview(collectionViewGallery)
        collectionViewGallery.addSubview(addGalleryButton)
        containerViewGallery.addSubview(saveGalleryButton)
        containerViewGallery.addSubview(editModeGalleryButton)
      
        /*
        containerView.addSubview(nameLabel)
        containerView.addSubview(saveSizeLabel)
        containerView.addSubview(collectionViewTitul)
        collectionViewTitul.addSubview(addButton)
        containerView.addSubview(saveButton)
        containerView.addSubview(editModeButton)
        */
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addPhotoButtonGalleryTapped() {
        let imagePickerGallery = UIImagePickerController()
        imagePickerGallery.delegate = self
        imagePickerGallery.sourceType = .photoLibrary
      //  present(imagePickerGallery, animated: true)
    }
    
    @objc func saveButtonGalleryTapped() {
        // Save photos logic
        saveGalleryButton.isHidden = true
        isEditMode = false
        editModeGalleryButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        collectionViewGallery.reloadData()
    }
    
    @objc func toggleEditGalleryMode() {
        isEditMode.toggle()
        let icon = isEditMode ? "xmark" : "pencil"
        editModeGalleryButton.setImage(UIImage(systemName: icon), for: .normal)
        collectionViewGallery.reloadData()
    }
    
    
    @objc func deletePhotoGallery(sender: UIButton) {
        photos.remove(at: sender.tag)
        collectionViewGallery.reloadData()
        if photos.isEmpty {
            saveGalleryButton.isHidden = true // Hide save button if no photos
        }
    }
    
    @objc func toggleFavoriteGallery(sender: UIButton) {
        let index = sender.tag
        photos[index].isFavorite.toggle()
        collectionViewGallery.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count + 1 // Additional cell for the "add photo" button
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if indexPath.row == photos.count {
                // The last cell for adding photos
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryPhotoCollViewCell", for: indexPath) as! GalleryPhotoCollViewCell
                cell.imageViewGallery.image = UIImage(systemName: "camera")
                cell.imageViewGallery.tintColor = .systemGray4
                cell.backgroundColor = .systemGray5
                cell.imageViewGallery.layer.cornerRadius = 10
                cell.layer.cornerRadius = 10
                cell.favoriteButtonGallery.isHidden = true
                cell.deleteButtonGallery.isHidden = true
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryPhotoCollViewCell", for: indexPath) as! GalleryPhotoCollViewCell
                let photo = photos[indexPath.row]
                cell.layer.cornerRadius = 10
                cell.imageViewGallery.image = photo.image
                cell.favoriteIconGallery.isHidden = !photo.isFavorite
                cell.imageViewGallery.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                cell.imageViewGallery.layer.cornerRadius = 10
                cell.deleteButtonGallery.tag = indexPath.row
                cell.favoriteButtonGallery.tag = indexPath.row
                cell.deleteButtonGallery.addTarget(self, action: #selector(deletePhotoGallery), for: .touchUpInside)
                cell.favoriteButtonGallery.addTarget(self, action: #selector(toggleFavoriteGallery), for: .touchUpInside)
                // Show delete and favorite buttons only in edit mode
                cell.favoriteButtonGallery.isHidden = !isEditMode
                cell.deleteButtonGallery.isHidden = !isEditMode
               // return cellGallery
                return cell
            }
        }
    
    
}
