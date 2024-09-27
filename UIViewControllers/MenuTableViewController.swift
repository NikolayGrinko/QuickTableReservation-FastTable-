//
//  MenuTableViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 26.09.2024.
//

import UIKit

class MenuTableViewController: UIViewController {

    let avatarView = AvatarView()
    let bellImage = UIImage(systemName: "bell")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetting()
        view.addSubview(avatarsImage)
        view.addSubview(button)
       
    }
    
    let avatarsImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "bell")
        image.tintColor = .lightGray
        image.frame = CGRect(x: 350, y: 95, width: 30, height: 30)
        return image
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 365, y: 90, width: 16, height: 16)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(notificationTap), for: .touchUpInside)
        return button
    }()
    
    @objc func notificationTap() {
        print("Всего пришло 2 оповещения")
    }
    
    private func  navigationSetting() {
        let leftBarButtonItem = UIBarButtonItem(customView: avatarView)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
//        let rightBarButtonItem = UIBarButtonItem(image: bellImage, style: .done, target: nil, action: nil)
//        self.navigationItem.rightBarButtonItem = rightBarButtonItem
//        self.navigationItem.rightBarButtonItem?.tintColor = .lightGray
        
    }
}
