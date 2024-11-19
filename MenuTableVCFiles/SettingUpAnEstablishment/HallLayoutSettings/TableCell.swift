//
//  TableCell.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 19.11.2024.
//

import UIKit

class TableCell: UICollectionViewCell {

    private let numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        contentView.addSubview(numberLabel)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .lightGray

        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(number: String) {
        numberLabel.text = number
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


