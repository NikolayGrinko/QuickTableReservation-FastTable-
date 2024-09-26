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
        
       
        let leftBarButtonItem = UIBarButtonItem(customView: avatarView)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightBarButtonItem = UIBarButtonItem(image: bellImage, style: .done, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = .lightGray
        
    }
    
}
