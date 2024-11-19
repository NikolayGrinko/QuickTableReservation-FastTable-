//
//  BasicViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 12.11.2024.
//

import UIKit

class BasicViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

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
    
    let button = UIButton()
    private lazy var restaurButton: UIButton = {
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
        button.configuration = config
        button.frame = CGRect(x: 10, y: 170, width: 180, height: 60)
        button.addTarget(self, action: #selector(goToInfo), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        view.addSubview(button)
        return button
    }()
    
    @objc private func goToInfo() {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Добавление обьектов"
        view.backgroundColor = .white
        setupCollectionView()
        
        view.addSubview(nameLabel)
        view.addSubview(restaurButton)
        view.addSubview(restaurButton2)
        view.addSubview(numberLabel)
        view.addSubview(maxCountGuestsLabel)
        view.addSubview(restaurButton3)
        view.addSubview(restaurButton4)
        view.addSubview(electTableFormat)
       
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
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            //collectionView.widthAnchor.constraint(equalToConstant: 100)
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
        cell.configure(number: "\(12)")
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
