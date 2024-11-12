//
//  HallLayoutViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 12.11.2024.
//

import UIKit

class HallLayoutViewController: UIViewController {
    
    private var savedTables: [UIView] = []
    private let listButton = UIButton()
    private let schemeButton = UIButton()
    private let hallButtons: [UIButton] = [UIButton(), UIButton(), UIButton()]
    private let overlayButton = UIButton()
    private let stopButton = UIButton()
    
    private let saveButton = UIButton()
    private let overlayView = TableOverlayView()
    private var placedTables: [UIView] = []
    
    private var selectedMode: Int = 0 // 0 - Список, 1 - Схема
    private var selectedHallIndex = 0
    private var halls: [[UIView]] = [[]] // Массив с массивами столов для каждого зала
    
    private let modeSwitcherView = UIView()
    private let redOverlayView = UIView()
    private let grayUiView = UIView()
    private let gridView = UIView()
    
    let button = UIButton()
    private lazy var basicButton: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.subtitle = "Основной зал"
        config.baseBackgroundColor = .red
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 7, bottom: 5, trailing: 7)
        config.cornerStyle = .large
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.white
            return updated
        }
        if let image = UIImage(named: "tochka")?.withTintColor(.white, renderingMode: .alwaysOriginal) {
            config.image = image // Добавляем черное изображение
            config.imagePadding = 10                    // Отступ изображения от текста
            config.imagePlacement = .trailing           // Располагаем изображение слева от текста
        }
        // Присваиваем конфигурацию кнопке
        button.configuration = config
        button.addTarget(self, action: #selector(goToInfo), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        view.addSubview(button)
        return button
    }()
    
    @objc private func goToInfo() {
        print("restaurant")
        let restaurant = BasicViewController()
        restaurant.modalPresentationStyle = .custom
        present(restaurant, animated: true)
    }
    
    
    let button2 = UIButton()
    private lazy var basicButton2: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.subtitle = "Веранда"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 7, bottom: 5, trailing: 7)
        config.cornerStyle = .large
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.systemGray3
            return updated
        }
        if let image = UIImage(named: "tochka")?.withTintColor(.systemGray3, renderingMode: .alwaysOriginal) {
            config.image = image // Добавляем черное изображение
            config.imagePadding = 10                    // Отступ изображения от текста
            config.imagePlacement = .trailing           // Располагаем изображение слева от текста
        }
        // Присваиваем конфигурацию кнопке
        button2.configuration = config
        button2.addTarget(self, action: #selector(goToInfo2), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        view.addSubview(button2)
        return button2
    }()
    
    @objc private func goToInfo2() {
        print("restaurant")
        let restaurant = BasicViewController()
        restaurant.modalPresentationStyle = .custom
        //navigationController?.pushViewController(restaurant, animated: true)
        present(restaurant, animated: true)
    }
    
    
    let button3 = UIButton()
    private lazy var basicButton3: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
       // config.subtitle = "Веранда"
        config.baseBackgroundColor = .white
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 1, leading: 1, bottom: 1, trailing: 1)
        config.cornerStyle = .large
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.blue
            return updated
        }
        if let image = UIImage(named: "plus")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal) {
            config.image = image // Добавляем черное изображение
            config.imagePadding = 0                    // Отступ изображения от текста
           // config.cornerStyle = .small
            config.imagePlacement = .bottom           // Располагаем изображение слева от текста
        }
        
        // Присваиваем конфигурацию кнопке
        button3.configuration = config
        button3.addTarget(self, action: #selector(goToInfo3), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        view.addSubview(button3)
        return button3
    }()
    
    @objc private func goToInfo3() {
        print("restaurant")
        let restaurant = BasicViewController()
        restaurant.modalPresentationStyle = .custom
        //navigationController?.pushViewController(restaurant, animated: true)
        present(restaurant, animated: true)
    }
    
    private let imageViewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "клетка")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var settingButton: UIButton = {
        let setButton = UIButton(type: .system)
        setButton.setTitle("Сохранить изменения", for: .normal)
        setButton.tintColor = .white
        setButton.isHidden = true
        setButton.backgroundColor = .red
        setButton.layer.cornerRadius = 10
        setButton.translatesAutoresizingMaskIntoConstraints = false
        setButton.addTarget(self, action: #selector(tapSettingButton), for: .touchUpInside)
        return setButton
    }()
    
    @objc private func tapSettingButton() {
        print("Сохранить изменения")
    }
    
   // private let categoriesMenu = CategoriesMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Редактирование столов"
        navigationController?.navigationBar.scrollEdgeAppearance = .init()
        navigationController?.navigationItem.title = "Редактирование столов"
        view.backgroundColor = .white
       // view.addSubview(categoriesMenu)
        view.addSubview(imageViewImage)
        view.addSubview(settingButton)
        view.addSubview(basicButton)
        view.addSubview(basicButton2)
        view.addSubview(basicButton3)
        
        setupOverlayButton()
        setupSaveButton()
        setupOverlayView()
        
        stopOverlayButton()
        
        setupModeSwitcher()
        
        setconstraints()
        
        saveTablePositions()
    }
    
    private func setupOverlayButton() {
        overlayButton.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        overlayButton.tintColor = .white
        overlayButton.backgroundColor = .red
        overlayButton.layer.cornerRadius = 10
        overlayButton.titleLabel?.font = .systemFont(ofSize: 24)
        overlayButton.addTarget(self, action: #selector(showOverlay), for: .touchUpInside)
        
        overlayButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overlayButton)
        
        NSLayoutConstraint.activate([
            overlayButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -5),
            overlayButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),
            overlayButton.heightAnchor.constraint(equalToConstant: 50),
            overlayButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    ///----------------------
    private func stopOverlayButton() {
        stopButton.isHidden = true
        stopButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        stopButton.backgroundColor = .red
        stopButton.tintColor = .white
        stopButton.layer.cornerRadius = 10
        stopButton.titleLabel?.font = .systemFont(ofSize: 24)
        stopButton.addTarget(self, action: #selector(stopShowOverlay), for: .touchUpInside)
        
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stopButton)
        
        NSLayoutConstraint.activate([
            stopButton.leadingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: 0),
            stopButton.topAnchor.constraint(equalTo: overlayView.topAnchor, constant: 10),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupSaveButton() {
        saveButton.setTitle("Сохранить изменения", for: .normal)
        saveButton.backgroundColor = .red
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.addTarget(self, action: #selector(saveTableLayout), for: .touchUpInside)
        saveButton.tintColor = .white
        saveButton.layer.cornerRadius = 10
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    private func setupOverlayView() {
        overlayView.delegate = self
        overlayView.isHidden = true
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overlayView)
        
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            overlayView.heightAnchor.constraint(equalToConstant: 300),
            overlayView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func selectListTab() {
        updateTabSelection(listSelected: true)
    }
    
    @objc private func selectSchemeTab() {
        updateTabSelection(listSelected: false)
    }
    
    private func updateTabSelection(listSelected: Bool) {
        listButton.setTitleColor(listSelected ? .black : .systemGray4, for: .normal)
        schemeButton.setTitleColor(listSelected ? .systemGray4 : .black, for: .normal)
    
    }
    
    @objc private func switchHall(_ sender: UIButton) {
        selectedHallIndex = sender.tag
        hallButtons.forEach { $0.backgroundColor = .lightGray }
        sender.backgroundColor = .red
    }
    
    @objc private func showOverlay() {
        overlayView.isHidden = false
        stopButton.isHidden = false
    }
    
    @objc private func stopShowOverlay() {
        stopButton.isHidden = true
        overlayView.isHidden = true
    }
    
    
    @objc private func saveTableLayout() {
        // Сохранение положения столов
        var savedTablePositions = [[String: CGFloat]]()
        
        for table in savedTables {
            let position = [
                "x": table.frame.origin.x,
                "y": table.frame.origin.y,
                "width": table.frame.width,
                "height": table.frame.height
            ]
            savedTablePositions.append(position)
        }
        
        UserDefaults.standard.set(savedTablePositions, forKey: "savedTablePositions")
        print("Table layout saved!")
        
       // saveTablePositions()
    }
    
    private func saveTablePositions() {
        // Логика для сохранения расположения столов
        guard let savedTablePositions = UserDefaults.standard.array(forKey: "savedTablePositions") as? [[String: CGFloat]] else { return }
        
        for position in savedTablePositions {
            let table = UIView()
            table.backgroundColor = .green
            table.frame = CGRect(x: position["x"] ?? 0, y: position["y"] ?? 0, width: position["width"] ?? 50, height: position["height"] ?? 50)
            view.addSubview(table)
            savedTables.append(table)
        }
    }

    
    private func setupModeSwitcher() {
        // Кнопки "Список" и "Схема" с наложенной красной полосой
        let listButton = UIButton(type: .system)
        listButton.setTitle("Список", for: .normal)
        listButton.setTitleColor(.black, for: .normal)
        listButton.addTarget(self, action: #selector(selectListMode), for: .touchUpInside)
        
        let schemeButton = UIButton(type: .system)
        schemeButton.setTitle("Схема", for: .normal)
        schemeButton.setTitleColor(.black, for: .normal)
        schemeButton.addTarget(self, action: #selector(selectSchemeMode), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [listButton, schemeButton])
        stackView.axis = .horizontal
        stackView.spacing = 100
        
        modeSwitcherView.addSubview(stackView)
        modeSwitcherView.addSubview(grayUiView)
        grayUiView.addSubview(redOverlayView)
        
        grayUiView.backgroundColor = .systemGray6
        grayUiView.frame = CGRect(x: 0, y: 35, width: view.frame.width, height: 5)
        
        redOverlayView.backgroundColor = .red
        redOverlayView.frame = CGRect(x: 0, y: 0, width: view.frame.width / 2, height: 5)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        modeSwitcherView.translatesAutoresizingMaskIntoConstraints = false
        redOverlayView.translatesAutoresizingMaskIntoConstraints = false
        grayUiView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(modeSwitcherView)
        
        NSLayoutConstraint.activate([
            modeSwitcherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            modeSwitcherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modeSwitcherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modeSwitcherView.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.centerXAnchor.constraint(equalTo: modeSwitcherView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: modeSwitcherView.centerYAnchor)
        ])
    }
    
    @objc private func selectListMode() {
        selectedMode = 0
        UIView.animate(withDuration: 0.3) {
            self.redOverlayView.frame.origin.x = 0
        }
    }
    
    @objc private func selectSchemeMode() {
        selectedMode = 1
        UIView.animate(withDuration: 0.3) {
            self.redOverlayView.frame.origin.x = self.view.frame.width / 2
        }
    }
    
    
    private func setconstraints() {
        
        basicButton.translatesAutoresizingMaskIntoConstraints = false
        basicButton2.translatesAutoresizingMaskIntoConstraints = false
        basicButton3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            imageViewImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageViewImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageViewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageViewImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
            
            settingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            settingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            settingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            settingButton.heightAnchor.constraint(equalToConstant: 50),
            
            basicButton.topAnchor.constraint(equalTo: modeSwitcherView.bottomAnchor, constant: 10),
            basicButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            basicButton.heightAnchor.constraint(equalToConstant: 40),
            basicButton.widthAnchor.constraint(equalToConstant: 140),
            
            basicButton2.topAnchor.constraint(equalTo: modeSwitcherView.bottomAnchor, constant: 10),
            basicButton2.leadingAnchor.constraint(equalTo: basicButton.trailingAnchor, constant: 10),
            basicButton2.heightAnchor.constraint(equalToConstant: 40),
            basicButton2.widthAnchor.constraint(equalToConstant: 100),
            
            basicButton3.topAnchor.constraint(equalTo: modeSwitcherView.bottomAnchor, constant: 10),
            basicButton3.leadingAnchor.constraint(equalTo: basicButton2.trailingAnchor, constant: 10),
            basicButton3.heightAnchor.constraint(equalToConstant: 40),
            basicButton3.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}

// MARK: - TableOverlayDelegate

extension HallLayoutViewController: TableOverlayDelegate {
    func didAddTable(_ table: UIView) {
        view.addSubview(table)
        savedTables.append(table)
    }
}

