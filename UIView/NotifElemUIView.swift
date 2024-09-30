//
//  NotifElemUIView.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 29.09.2024.
//

import Foundation
import UIKit

struct NotifElem {
    let title: String
    let titleSet: String
    let titleData: String
}

class NotifElemUIView: UITableViewCell {
    
//    let identifier = "NotifElemUIView"
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Заголовок уведомления"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 1
        label.textAlignment = .left
       return label
    }()
    
    private var titleSetLabel: UILabel = {
        let label = UILabel()
        label.text = "Превью содержимого 2 строчки не более. Превью содержимого 2 строчки не более. "
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 2
       return label
    }()
    
    private var titleDataLabel: UILabel = {
        let label = UILabel()
        label.text = "14.05.2024"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .left
       return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        addSubview(titleSetLabel)
        addSubview(titleDataLabel)
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNotif(title: NotifElem) {
        
        titleLabel.text = title.title
        titleSetLabel.text = title.titleSet
        titleDataLabel.text = title.titleData
        
    }
    
    private func constraint() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleSetLabel.translatesAutoresizingMaskIntoConstraints = false
        titleDataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            
            titleSetLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleSetLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 15),
            titleSetLabel.heightAnchor.constraint(equalToConstant: 40),
            titleSetLabel.widthAnchor.constraint(equalToConstant: 200),
            titleSetLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            titleDataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            titleDataLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleDataLabel.heightAnchor.constraint(equalToConstant: 20),
            titleDataLabel.widthAnchor.constraint(equalToConstant: 100),
            
        ])
        
    }
    
}
