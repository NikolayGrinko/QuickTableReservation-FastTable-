//
//  PopUpViewUIView.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 01.10.2024.
//

import Foundation
import UIKit

class PopUpViewUIView: UITableViewCell {
    
    private var titleNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Fruit Bunny."
        label.font = .systemFont(ofSize: 16)
        //label.frame = CGRect(x: 0, y: 5, width: 150, height: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private var titleAdressLabel: UILabel = {
        let label = UILabel()
        label.text = "улица Лисицина 2А,Ярославль,Ярославская область. "
        label.font = .systemFont(ofSize: 12)
        //label.frame = CGRect(x: 0, y: 25, width: 300, height: 40)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    
    private let imagesViewTap: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "серый")
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
        self.addSubview(titleAdressLabel)
        self.addSubview(imagesViewTap)
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraint() {
        
        titleNameLabel.translatesAutoresizingMaskIntoConstraints = false
        titleAdressLabel.translatesAutoresizingMaskIntoConstraints = false
        imagesViewTap.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            titleNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleNameLabel.heightAnchor.constraint(equalToConstant: 20),
            titleNameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            titleAdressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleAdressLabel.topAnchor.constraint(equalTo: titleNameLabel.topAnchor, constant: 20),
            titleAdressLabel.heightAnchor.constraint(equalToConstant: 20),
            titleAdressLabel.widthAnchor.constraint(equalToConstant: 330),
            titleAdressLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            imagesViewTap.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imagesViewTap.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            imagesViewTap.heightAnchor.constraint(equalToConstant: 25),
            imagesViewTap.widthAnchor.constraint(equalToConstant: 25),
            
        ])
        
    }
    
}
