//
//  BasicViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 12.11.2024.
//

import UIKit

class BasicViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    private let switches: UISwitch = {
        let switches = UISwitch()
        switches.onTintColor = .lightGray
        switches.frame = CGRect(x: 10, y: 520, width: 70, height: 30)
        return switches
    }()
    
    private let employeeVisibilityLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Виден только сотрудникам"
        nameLabel.frame = CGRect(x: 90, y: 520, width: 320, height: 20)
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 14)
        return nameLabel
    }()
    
    private let guestVisibilityLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "При включении гости не будут видеть этот стол в приложении FastTable, но он будет доступен для сотрудников"
        nameLabel.frame = CGRect(x: 90, y: 540, width: 320, height: 40)
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .lightGray
        nameLabel.font = .systemFont(ofSize: 12)
        return nameLabel
    }()
    
    private let photoTableLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Фото стола"
        nameLabel.frame = CGRect(x: 10, y: 590, width: 150, height: 20)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 20)
        return nameLabel
    }()
    
    private let extensionLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "- Расширение: jpeg, jpeg"
        nameLabel.frame = CGRect(x: 10, y: 690, width: 380, height: 10)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 13)
        return nameLabel
    }()
    
    private let sizeFilesLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "- Размер файла: не более 25 Mb"
        nameLabel.frame = CGRect(x: 10, y: 715, width: 380, height: 10)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 13)
        return nameLabel
    }()
    
    let arrayImage = [UIImage(named: "table"), UIImage(named: "table2"), UIImage(named: "table3"), UIImage(named: "table4")]
    
    private let cellIdentifier = "TableCell"
    private var selectedIndexPath: IndexPath?
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Основная информация"
        nameLabel.frame = CGRect(x: 10, y: 120, width: 250, height: 30)
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 20)
        return nameLabel
    }()
    
    private let numberLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Порядковый номер"
        nameLabel.frame = CGRect(x: 10, y: 250, width: 180, height: 30)
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 17)
        return nameLabel
    }()
    
    private let maxCountGuestsLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Макс. кол-во гостей"
        nameLabel.frame = CGRect(x: 10, y: 310, width: 180, height: 30)
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 17)
        return nameLabel
    }()
    
    private let electTableFormat: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Выберите форму стола для размещения на схеме  "
        nameLabel.frame = CGRect(x: 10, y: 370, width: 380, height: 30)
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 13, weight: .light)
        return nameLabel
    }()
    
    let buttons = UIButton()
    private lazy var restaur12Button: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Тип обьекта"
        config.subtitle = "Стол"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.lightGray
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 17)
            updated.foregroundColor = UIColor.black
            return updated
        }
        if let image = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal) {
            config.image = image // Добавляем черное изображение
            config.imagePadding = 50                    // Отступ изображения от текста
            config.imagePlacement = .trailing           // Располагаем изображение слева от текста
        }
        // Присваиваем конфигурацию кнопке
        buttons.configuration = config
        buttons.frame = CGRect(x: 10, y: 170, width: 180, height: 60)
        buttons.addTarget(self, action: #selector(goToInfo1), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        view.addSubview(buttons)
        return buttons
    }()
    
    @objc private func goToInfo1() {
        print("restaurant")
        let restaurant = SettingEstablViewController()
        if let sheet = restaurant.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        present(restaurant, animated: true)
    }
    
    let button2 = UIButton()
    private lazy var restaurButton2: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Зал/Этаж"
        config.subtitle = "Основной зал"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 14)
            updated.foregroundColor = UIColor.lightGray
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.black
            return updated
        }
        if let image = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal) {
            config.image = image // Добавляем черное изображение
            config.imagePadding = 30                    // Отступ изображения от текста
            config.imagePlacement = .trailing           // Располагаем изображение слева от текста
        }
        // Присваиваем конфигурацию кнопке
        button2.configuration = config
        button2.frame = CGRect(x: 200, y: 170, width: 180, height: 60)
        button2.addTarget(self, action: #selector(goToInfo2), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        view.addSubview(button2)
        return button2
    }()
    
    @objc private func goToInfo2() {
        print("restaurant")
        let restaurant = SettingEstablViewController()
        if let sheet = restaurant.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        present(restaurant, animated: true)
    }
    
    let button3 = UIButton()
    private lazy var restaurButton3: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "12"
        //config.subtitle = "Стол"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 20)
            updated.foregroundColor = UIColor.black
            return updated
        }
        // Присваиваем конфигурацию кнопке
        button3.configuration = config
        button3.frame = CGRect(x: 200, y: 240, width: 180, height: 50)
        button3.addTarget(self, action: #selector(goToInfo3), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        view.addSubview(button3)
        return button3
    }()
    
    @objc private func goToInfo3() {
        print("restaurant")
        let restaurant = SettingEstablViewController()
        if let sheet = restaurant.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        present(restaurant, animated: true)
    }
    
    let button4 = UIButton()
    private lazy var restaurButton4: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "2"
        //config.subtitle = "Стол"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 50, bottom: 5, trailing: 50)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 20)
            updated.foregroundColor = UIColor.black
            return updated
        }
        // Присваиваем конфигурацию кнопке
        button4.configuration = config
        button4.frame = CGRect(x: 200, y: 300, width: 180, height: 50)
        button4.addTarget(self, action: #selector(goToInfo4), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        view.addSubview(button4)
        return button3
    }()
    
    @objc private func goToInfo4() {
        print("restaurant")
        let restaurant = SettingEstablViewController()
        if let sheet = restaurant.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        present(restaurant, animated: true)
    }
    
    let button12Tap = UIButton()
    private lazy var nameOfTheEstablishmentButtons: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Загрузить фото"
        //config.subtitle = "улица Лисицина 2А,Ярославль, ярославская область"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .leading
        config.titleAlignment = .trailing
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 20)
            updated.foregroundColor = UIColor.black
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 12)
            updated.foregroundColor = UIColor.lightGray
            return updated
        }
        if let image = UIImage(named: "next")?.withTintColor(.black, renderingMode: .alwaysOriginal) {
            config.image = image // Добавляем черное изображение
            config.imagePadding = 10                  // Отступ изображения от текста
            config.imagePlacement = .leading           // Располагаем изображение слева от текста
        }
        // Присваиваем конфигурацию кнопке
        button12Tap.configuration = config
        button12Tap.frame = CGRect(x: 10, y: 620, width: 380, height: 50)
        button12Tap.addTarget(self, action: #selector(goToInfo12), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button12Tap.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button12Tap)
        return button12Tap
    }()
    
    // 2 переход с навигацией
    @objc private func goToInfo12() {
        print("restaurant")
//        let restaurant = "___________"()
//        restaurant.modalPresentationStyle = .custom
//        present(restaurant, animated: true)
//        //
//        navigationController?.pushViewController(restaurant, animated: true)
    }

    let buttonsTap2 = UIButton()
    private lazy var addTapButtons: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Добавить"
        config.baseBackgroundColor = .red
        config.buttonSize = .medium
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 20)
            updated.foregroundColor = UIColor.white
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 12)
            updated.foregroundColor = UIColor.red
            return updated
        }
        // Присваиваем конфигурацию кнопке
        buttonsTap2.configuration = config
        buttonsTap2.frame = CGRect(x: 10, y: 735, width: 380, height: 50)
        buttonsTap2.addTarget(self, action: #selector(goToIn), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        //buttonsTap2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsTap2)
        return buttonsTap2
    }()
    
    // 2 переход с навигацией
    @objc private func goToIn() {
        print("restaurant")
//        let restaurant = "___________"()
//        restaurant.modalPresentationStyle = .custom
//        present(restaurant, animated: true)
//        //
//        navigationController?.pushViewController(restaurant, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Добавление обьектов"
        view.backgroundColor = .white
        setupCollectionView()
        
        view.addSubview(nameLabel)
        view.addSubview(restaur12Button)
        view.addSubview(restaurButton2)
        view.addSubview(numberLabel)
        view.addSubview(maxCountGuestsLabel)
        view.addSubview(restaurButton3)
        view.addSubview(restaurButton4)
        view.addSubview(electTableFormat)
        view.addSubview(switches)
        view.addSubview(employeeVisibilityLabel)
        view.addSubview(guestVisibilityLabel)
        view.addSubview(photoTableLabel)
        view.addSubview(nameOfTheEstablishmentButtons)
        view.addSubview(extensionLabel)
        view.addSubview(sizeFilesLabel)
        view.addSubview(addTapButtons)
       
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(TableCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = false

        view.addSubview(collectionView)

        // Constraints
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    // MARK: - UICollectionView DataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TableCell else {
            return UICollectionViewCell()
        }
        //cell.configure(number: "\(12)", imageCell: arrayImage[indexPath.row]!)
        cell.configure(imageCell: arrayImage[indexPath.row]!)
        return cell
    }

    // MARK: - UICollectionView Delegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Deselect the previously selected cell
        if let selectedIndexPath = selectedIndexPath,
           let previousCell = collectionView.cellForItem(at: selectedIndexPath) as? TableCell {
            previousCell.setSelected(false)
        }

        // Select the new cell
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? TableCell {
            selectedCell.setSelected(true)
        }

        // Update the selected index path
        selectedIndexPath = indexPath
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
}


