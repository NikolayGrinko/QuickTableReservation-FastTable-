//
//  TabBarController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 26.09.2024.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }
    
    private func setupController() {
         let placement = TablePlacementViewController()
        placement.title = "Столы"
        let reservation = TableReservationViewController()
        reservation.title = "Резерв"
        let openTab = OpenTableViewController()
        openTab.title = "Открытые"
        let close = CloseTableViewController()
        close.title = "Закрытые"
        let menu = MenuTableViewController()
        //menu.title = "Меню"
        
        placement.navigationItem.largeTitleDisplayMode = .never
        reservation.navigationItem.largeTitleDisplayMode = .never
        openTab.navigationItem.largeTitleDisplayMode = .never
        close.navigationItem.largeTitleDisplayMode = .never
        menu.navigationItem.largeTitleDisplayMode = .never
        
        let nav1 = UINavigationController(rootViewController: placement)
        let nav2 = UINavigationController(rootViewController: reservation)
        let nav3 = UINavigationController(rootViewController: openTab)
        let nav4 = UINavigationController(rootViewController: close)
        let nav5 = UINavigationController(rootViewController: menu)
         
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        nav5.navigationBar.prefersLargeTitles = false
        
        nav1.tabBarItem = UITabBarItem(title: "Столы", image: UIImage(systemName: "tablecells"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Резерв", image: UIImage(systemName: "calendar"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Открытые", image: UIImage(systemName: "arrow.up.to.line.circle.fill"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Закрытые", image: UIImage(systemName: "list.bullet.clipboard.fill"), tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "ellipsis.circle.fill"), tag: 5)
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
        
     }
    
    // MARK: animations tap element tabBar_1
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.simpleAnimationWhereSelectItem(item)
        
    }
    // MARK: animations tap element tabBar_2
    func simpleAnimationWhereSelectItem(_ item: UIBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else {return}
        
        let timeInterval: TimeInterval = 0.5
        let propertyAnimation = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }
        propertyAnimation.addAnimations({barItemView.transform = .identity}, delayFactor: CGFloat(timeInterval))
        propertyAnimation.startAnimation()
    }
    
}
