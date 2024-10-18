//
//  PhotoCellVC.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 17.10.2024.
//
import UIKit


class PhotoTitul {
    var image: UIImage
    var isFavorite: Bool
    
    init(image: UIImage, isFavorite: Bool) {
        self.image = image
        self.isFavorite = isFavorite
    }
}

class PhotoGallery {
    var image: UIImage
    var isFavorite: Bool
    
    init(image: UIImage, isFavorite: Bool) {
        self.image = image
        self.isFavorite = isFavorite
    }
}
