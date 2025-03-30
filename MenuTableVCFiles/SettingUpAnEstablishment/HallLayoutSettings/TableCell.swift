//
//  TableCell.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 19.11.2024.
//

import UIKit

class TableCell: UICollectionViewCell {

    private let frontImageCell: UIImageView = {
        let imageCell = UIImageView()
        imageCell.image = UIImage(named: "table")
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        imageCell.contentMode = .scaleAspectFit
        return imageCell
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        contentView.addSubview(frontImageCell)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .lightGray

        NSLayoutConstraint.activate([
            frontImageCell.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            frontImageCell.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(imageCell: UIImage) {
        frontImageCell.image = imageCell
    }

    func setSelected(_ selected: Bool) {
        if selected {
            layer.borderWidth = 2
            layer.borderColor = UIColor.red.cgColor
        } else {
            layer.borderWidth = 0
            layer.borderColor = nil
        }
    }
}


