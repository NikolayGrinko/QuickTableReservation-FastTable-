//
//  AvatarView.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 26.09.2024.
//

import UIKit

class AvatarView: UIView {
    
    let avatarImgView = UIImageView()
    let nameLabel = UILabel()
    let ownerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 44, height: 52))
        
        let avatar = #imageLiteral(resourceName: "someone")
        avatarImgView.image = avatar
        avatarImgView.contentMode = .scaleAspectFill
        avatarImgView.autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin, .flexibleRightMargin, .flexibleBottomMargin]
        self.addSubview(avatarImgView)
        self.addSubview(nameLabel)
        self.addSubview(ownerLabel)
    
        avatarImgView.layer.borderWidth = 1.0
        avatarImgView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        avatarImgView.clipsToBounds = true
        
        nameLabel.text = "Петров Илья Алексеевич"
        nameLabel.font = .systemFont(ofSize: 14, weight: .bold)
        
        ownerLabel.text = "Владелец"
        ownerLabel.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let newHeight = self.frame.size.height + 6.0
        avatarImgView.bounds = CGRect(x: 0, y: 5, width: newHeight, height: newHeight)
        avatarImgView.center = CGPoint(x: self.bounds.midX - 40, y: self.bounds.midY + 25)
        avatarImgView.layer.cornerRadius = newHeight / 2.0
        
        nameLabel.bounds = CGRect(x: 100, y: 0, width: 200, height: 15)
        nameLabel.center = CGPoint(x: self.bounds.midX + 90, y: self.bounds.midY + 15)
        nameLabel.textColor = .black
        
        ownerLabel.bounds = CGRect(x: 50, y: 15, width: 80, height: 10)
        ownerLabel.center = CGPoint(x: self.bounds.midX + 30, y: self.bounds.midY + 35)
        ownerLabel.textColor = .lightGray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
