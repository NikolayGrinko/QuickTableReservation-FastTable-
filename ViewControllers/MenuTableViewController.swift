//
//  MenuTableViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 26.09.2024.
//

import UIKit

class MenuTableViewController: UIViewController {

    let clickerSelector = ClickedSelectedEstablishmentUIView(frame: CGRect(x: 30, y: 160, width: 330, height: 50))
    
    let button = UIButton(frame: CGRect(x: 20, y: 150, width: 360, height: 80))
    
    
    let avatarView = AvatarView()
    let sizeTapButton = CustomButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(clickerSelector)
        view.addSubview(avatarView)
      
        avatarView.frame = CGRect(x: 0, y: 60, width: 150, height: 40)
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
        view.addSubview(avatarsImage)
        view.addSubview(sizeTapButton)
        pointSizeButton()
        //navigationSetting()
    }
    
    @objc func tapButton() {
        print("нажата вью поверх баттона")
        let notifTableVC = NotifTableViewController()
                if let sheet = notifTableVC.sheetPresentationController {
                    sheet.detents = [.medium()]
                    sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                    sheet.prefersGrabberVisible = true
                    sheet.largestUndimmedDetentIdentifier = .medium
                    sheet.preferredCornerRadius = 20
                    sheet.prefersEdgeAttachedInCompactHeight = true
                }
                present(notifTableVC, animated: true)
            }
    
    
    let avatarsImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "bell")
        image.tintColor = .lightGray
        image.frame = CGRect(x: 350, y: 95, width: 30, height: 30)
        return image
    }()
    
//    private func  navigationSetting() {
//        let leftBarButtonItem = UIBarButtonItem(customView: avatarView)
//        self.navigationItem.leftBarButtonItem = leftBarButtonItem
//    }
    
    private func pointSizeButton() {
        sizeTapButton.setTitle("2", for: .normal)
        sizeTapButton.tintColor = .white
        sizeTapButton.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        sizeTapButton.layer.cornerRadius = 9
        sizeTapButton.frame = CGRect(x: 365, y: 90, width: 18, height: 18)
        sizeTapButton.backgroundColor = .red
        sizeTapButton.addTarget(self, action: #selector(notifTap), for: .touchUpInside)
    }
    
    @objc func notifTap() {
        print("Всего пришло 2 оповещения")
        
        let tableVC = NotificationViewController()
        self.navigationController?.pushViewController(tableVC, animated: true)
        }
    }
     
    
//    @objc func notificationTap() {
//        print("Всего пришло 2 оповещения")
//        
//        let tableVC = NotificationTableViewController()
//        if let sheet = tableVC.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//            sheet.prefersGrabberVisible = true
//            sheet.largestUndimmedDetentIdentifier = .medium
//            sheet.preferredCornerRadius = 20
//            sheet.prefersEdgeAttachedInCompactHeight = true
//        }
//        present(tableVC, animated: true)
//    }
  
//}
