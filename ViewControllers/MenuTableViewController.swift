//
//  MenuTableViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 26.09.2024.
//

import UIKit

class MenuTableViewController: UIViewController {

    enum Section {
        case main
    }
    
    let avatarView = AvatarView()
    let sizeTapButton = CustomButton()
    
    let textLabel = UILabel()
    var dataSource: UICollectionViewDiffableDataSource<Section, OutlineItem>! = nil
    var outlineCollectionView: UICollectionView! = nil
    private var detailTargetChangeObserver: Any? = nil
    
    let clickerSelector = ClickedSelectedEstablishmentUIView(frame: CGRect(x: 30,
                                                                           y: 160,
                                                                           width: 330,
                                                                           height: 50))
    let button = UIButton(frame: CGRect(x: 20,
                                        y: 150,
                                        width: 360,
                                        height: 80))
    let flingButton: ActionButton = {
        let fliButton = ActionButton()
        fliButton.backgroundColor = .red
        fliButton.frame = CGRect(x: 20,
                                 y: 740,
                                 width: 350,
                                 height: 50)
        return fliButton
    }()
    
    class OutlineItem: Identifiable, Hashable {
        let imageName: String?
        let title: String
        let subitems: [OutlineItem]
        let items: OutlineItem?
        let outlineViewController: UIViewController.Type?
       // let storyboardName: String?
        

        init(imageName: String?, title: String, viewController: UIViewController.Type? = nil, items: OutlineItem? = nil, subitems: [OutlineItem] = []) {
            self.title = title
            self.subitems = subitems
            self.items = items
            self.outlineViewController = viewController
            self.imageName = imageName
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: OutlineItem, rhs: OutlineItem) -> Bool {
            return lhs.id == rhs.id
        }

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
        sizeTapButton.addTarget(self, action: #selector(notifTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(clickerSelector)
        view.addSubview(avatarView)
        view.addSubview(flingButton)
        view.addSubview(avatarsImage)
        view.addSubview(sizeTapButton)
        flingButton.addSubview(textLabel)
        textLabel.frame = CGRect(x: 120, y: 15, width: 150, height: 20)
        textLabel.text = "Начать смену"
        textLabel.textColor = .white
        
        avatarView.frame = CGRect(x: 0, y: 60, width: 150, height: 40)
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 10
       
        pointSizeButton()
        configureCollectionView()
        configureDataSource()
        // Add a translucent background to the primary view controller for the Mac.
        splitViewController?.primaryBackgroundStyle = .sidebar
        // покраска вьюКонтроллера
        view.backgroundColor = UIColor.clear
        // Listen for when the split view controller is expanded or collapsed for iPad multi-tasking,
        // and on device rotate (iPhones that support regular size class).
        detailTargetChangeObserver =
            NotificationCenter.default.addObserver(forName: UIViewController.showDetailTargetDidChangeNotification,
                                                   object: nil,
                                                   queue: OperationQueue.main,
                                                   using: { _ in
                // Posted when a split view controller is expanded or collapsed.
                // Re-load the data source, the disclosure indicators need to change (push vs. present on a cell).
                var snapshot = self.dataSource.snapshot()
                snapshot.reloadItems(self.menuItems)
                self.dataSource.apply(snapshot, animatingDifferences: false)
            })
        
        if navigationController!.traitCollection.userInterfaceIdiom == .mac {
            navigationController!.navigationBar.isHidden = true
        }
    }
    
    deinit {
        if let observer = detailTargetChangeObserver {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    lazy var controlsOutlineItem: OutlineItem = {
    
        var controlsSubItems = [
            
            OutlineItem(imageName: nil, title: NSLocalizedString("Настройки заведения", comment: ""), viewController: SettingEstablishmentViewController.self), //+++
            OutlineItem(imageName: nil, title: NSLocalizedString("Время работы", comment: ""), viewController: SegmentedControlViewController.self),
            OutlineItem(imageName: nil, title: NSLocalizedString("Настройка бронирования", comment: ""), viewController: SegmentedControlViewController.self),
            OutlineItem(imageName: nil, title: NSLocalizedString("Меню", comment: ""), viewController: SegmentedControlViewController.self),
            OutlineItem(imageName: nil, title: NSLocalizedString("Схемы залов", comment: ""), viewController: SegmentedControlViewController.self),
            OutlineItem(imageName: nil, title: NSLocalizedString("Депозиты", comment: ""), viewController: SegmentedControlViewController.self),
            OutlineItem(imageName:nil, title: NSLocalizedString("Интеграция", comment: ""), viewController: SegmentedControlViewController.self)
        ]
        
        return OutlineItem(imageName: "gear", title: "Настройки", subitems: controlsSubItems)
    }()
   // ___________________________
    
    lazy var analiticsOutline: OutlineItem = {
        return OutlineItem(imageName: "clock", title: NSLocalizedString("Аналитика", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    lazy var billingOutline: OutlineItem = {
        return OutlineItem(imageName: "book", title: NSLocalizedString("Биллинг", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    lazy var bellOutline: OutlineItem = {
        return OutlineItem(imageName: "bell", title: NSLocalizedString("Рассылки", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    lazy var flagsOutline: OutlineItem = {
        return OutlineItem(imageName: "flag", title: NSLocalizedString("Событие", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    lazy var starOutline: OutlineItem = {
        return OutlineItem(imageName: "star", title: NSLocalizedString("Рейтинг и отзывы", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    lazy var messageOutline: OutlineItem = {
        return OutlineItem(imageName: "message", title: NSLocalizedString("Обращения гостей", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    lazy var heartsOutline: OutlineItem = {
        return OutlineItem(imageName: "heart", title: NSLocalizedString("Служба поддержки", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    lazy var arrowOutline: OutlineItem = {
        return OutlineItem(imageName: "arrow.up", title: NSLocalizedString("Продвижение", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    lazy var personOutline: OutlineItem = {
        return OutlineItem(imageName: "person.2", title: NSLocalizedString("База гостей", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    lazy var collegiOutline: OutlineItem = {
        return OutlineItem(imageName: "key", title: NSLocalizedString("Сотрудники", comment: ""), viewController: SegmentedControlViewController.self)
    }()
    
    private lazy var menuItems: [OutlineItem] = {
        return [
            controlsOutlineItem,
            analiticsOutline,
            billingOutline,
            bellOutline,
            flagsOutline,
            starOutline,
            messageOutline,
            heartsOutline,
            arrowOutline,
            personOutline,
            collegiOutline
        ]
    }()

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
    
    @objc func notifTap() {
        print("Всего пришло 2 оповещения")
        
        let tableVC = NotificationViewController()
        self.navigationController?.pushViewController(tableVC, animated: true)
        }
    }
     
extension MenuTableViewController {

    private func configureCollectionView() {
        let collectionView =
        UICollectionView(frame: CGRect(x: 0, y: 250, width: view.frame.size.width, height: 470), collectionViewLayout: generateLayout())
        view.addSubview(collectionView)

        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.outlineCollectionView = collectionView
        collectionView.delegate = self
        
    }

    private func configureDataSource() {

        let containerCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, OutlineItem> { (cell, indexPath, menuItem) in

            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = menuItem.title
           
            if let image = menuItem.imageName {
                contentConfiguration.image = UIImage(systemName: image)
            }
            
            contentConfiguration.textProperties.font = .preferredFont(forTextStyle: .headline)
            cell.contentConfiguration = contentConfiguration
            
            let disclosureOptions = UICellAccessory.OutlineDisclosureOptions(style: .header)
            cell.accessories = [.outlineDisclosure(options: disclosureOptions)]
            
            let background = UIBackgroundConfiguration.clear()
            cell.backgroundConfiguration = background
            
            
        }
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, OutlineItem> { cell, indexPath, menuItem in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = menuItem.title
            
            if let image = menuItem.imageName {
                contentConfiguration.image = UIImage(systemName: image)
            }
            
            cell.contentConfiguration = contentConfiguration
            
            let background = UIBackgroundConfiguration.clear()
            cell.backgroundConfiguration = background
            
            cell.accessories = self.splitViewWantsToShowDetail() ? [] : [.disclosureIndicator()]
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, OutlineItem>(collectionView: outlineCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: OutlineItem) -> UICollectionViewCell? in
            // Return the cell.
            if item.subitems.isEmpty {
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: containerCellRegistration, for: indexPath, item: item)
            }
        }

        // Load our initial data.
        let snapshot = initialSnapshot()
        self.dataSource.apply(snapshot, to: .main, animatingDifferences: false)
    }

    private func generateLayout() -> UICollectionViewLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .sidebar)
        listConfiguration.backgroundColor = .white
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        return layout
    }

    private func initialSnapshot() -> NSDiffableDataSourceSectionSnapshot<OutlineItem> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<OutlineItem>()

        func addItems(_ menuItems: [OutlineItem], to parent: OutlineItem?) {
            snapshot.append(menuItems, to: parent)
            for menuItem in menuItems where !menuItem.subitems.isEmpty {
                addItems(menuItem.subitems, to: menuItem)
            }
        }
        addItems(menuItems, to: nil)
        return snapshot
    }
}
// MARK: - UICollectionViewDelegate

extension MenuTableViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let menuItem = self.dataSource.itemIdentifier(for: indexPath) else { return }
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if let viewController = menuItem.outlineViewController {
            navigationController?.pushViewController(viewController.init(), animated: true)
        }
        
    }
    
    private func splitViewWantsToShowDetail() -> Bool {
        return splitViewController?.traitCollection.horizontalSizeClass == .regular
    }
    
   
    private func pushOrPresentViewController(viewController: UIViewController) {
        if splitViewWantsToShowDetail() {
            let navVC = UINavigationController(rootViewController: viewController)
            splitViewController?.showDetailViewController(navVC, sender: navVC) // Replace the detail view controller.
            
            if navigationController!.traitCollection.userInterfaceIdiom == .mac {
                navVC.navigationBar.isHidden = true
            }
        } else {
            navigationController?.pushViewController(viewController, animated: true) // Just push instead of replace.
        }
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
