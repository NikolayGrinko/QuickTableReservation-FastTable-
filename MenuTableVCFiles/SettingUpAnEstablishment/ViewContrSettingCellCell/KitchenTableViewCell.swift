//
//  KitchenTableViewCell.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 15.10.2024.
//

import UIKit

class KitchenTableViewCell: UITableViewCell {
    
    
    
    var titleNameLabel: UILabel = {
        let label = UILabel()
        //label.text = "Fruit Bunny."
        label.font = .systemFont(ofSize: 16)
        //label.frame = CGRect(x: 0, y: 5, width: 150, height: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let imagesViewTap: UIImageView = {
        let image = UIImageView()
        //image.image = UIImage(named: "серый")
        //        image.frame.size.width = 10
        //        image.frame.size.height = 10
        //image.backgroundColor = .black
        // image.frame = CGRect(x: 330, y: 15, width: 25, height: 25)
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //super.init(frame: CGRect(x: 0, y: 5, width: 300, height: 70))
        self.addSubview(titleNameLabel)
        self.addSubview(imagesViewTap)
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraint() {
        
        titleNameLabel.translatesAutoresizingMaskIntoConstraints = false
        imagesViewTap.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            imagesViewTap.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imagesViewTap.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imagesViewTap.heightAnchor.constraint(equalToConstant: 30),
            imagesViewTap.widthAnchor.constraint(equalToConstant: 30),
            
            titleNameLabel.leadingAnchor.constraint(equalTo: imagesViewTap.trailingAnchor, constant: 10),
            titleNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleNameLabel.heightAnchor.constraint(equalToConstant: 20),
            titleNameLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
        }
    }
