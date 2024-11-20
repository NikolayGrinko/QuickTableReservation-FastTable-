//
//  NotificationViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 29.09.2024.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   // let notifElemUIView = NotifElemUIView()
    
    let tableView = UITableView()
    
    let identifier = "NotifElemUIView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Уведомления"
        navigationItem.largeTitleDisplayMode = .never
       
        tableView.rowHeight = UITableView.automaticDimension
        // Минимальная высота ячейки (если требуется)
        tableView.estimatedRowHeight = 44.0
        
        tapNext()
        tableView.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: view.frame.size.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NotifElemUIView.self, forCellReuseIdentifier: identifier)
    }
    
    private func tapNext() {
        let placement = NotificationViewController()
        placement.title = "Уведомления"
        placement.navigationItem.largeTitleDisplayMode = .never
        let nav1 = UINavigationController(rootViewController: placement)
        nav1.navigationBar.prefersLargeTitles = true
    }
        
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 4
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
