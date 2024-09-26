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
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: TablePlacementViewController(),
                title: "Столы",
                image: UIImage(systemName: "tablecells") //+++
            ),
            generateVC(
                viewController: TableReservationViewController(),
                title: "Резерв",
                image: UIImage(systemName: "calendar")  //+++
            ),
            generateVC(
                viewController: OpenTableViewController(),
                title: "Открытые",
                image: UIImage(systemName: "arrow.up.to.line.circle")  // +++
            ),
            generateVC(
                viewController: CloseTableViewController(),
                title: "Закрытые",
                image: UIImage(systemName: "list.bullet.clipboard") // +++
            ),
            generateVC(
                viewController: MenuTableViewController(),
                title: "Меню",
                image: UIImage(systemName: "ellipsis.circle.fill")
            )
        ]
    }
    
    //MARK: override func
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {

        //tabBar.barTintColor = .blue
        
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = .systemGray
    }
    
    // MARK: animations tap element tabBar_1
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.SimpleAnimationWhereSelectItem(item)
        
    }
    // MARK: animations tap element tabBar_2
    func SimpleAnimationWhereSelectItem(_ item: UIBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else {return}
        
        let timeInterval: TimeInterval = 0.5
        let propertyAnimation = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }
        propertyAnimation.addAnimations({barItemView.transform = .identity}, delayFactor: CGFloat(timeInterval))
        propertyAnimation.startAnimation()
    }
    
}
