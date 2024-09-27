//
//  MenuTableViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 26.09.2024.
//

import UIKit

class MenuTableViewController: UIViewController {

    let avatarView = AvatarView()
    let sizeTapButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationSetting()
        view.addSubview(avatarsImage)
        view.addSubview(sizeTapButton)
        pointSizeButton()
    }
    
    let avatarsImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "bell")
        image.tintColor = .lightGray
        image.frame = CGRect(x: 350, y: 95, width: 30, height: 30)
        return image
    }()
    
    private func pointSizeButton() {
        sizeTapButton.setTitle("2", for: .normal)
        sizeTapButton.tintColor = .white
        sizeTapButton.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        sizeTapButton.layer.cornerRadius = 9
        sizeTapButton.frame = CGRect(x: 365, y: 90, width: 18, height: 18)
        sizeTapButton.backgroundColor = .red
        sizeTapButton.addTarget(self, action: #selector(notificationTap), for: .touchUpInside)
    }
    
    @objc func notificationTap() {
        print("Всего пришло 2 оповещения")
        
        let tableVC = NotificationTableViewController()
        if let sheet = tableVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        present(tableVC, animated: true)
    }
     
    private func  navigationSetting() {
        let leftBarButtonItem = UIBarButtonItem(customView: avatarView)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        

    }
}
