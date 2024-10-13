//
//  SettingEstablishmentViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 12.10.2024.
//

import UIKit

class SettingEstablishmentViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.contentSize = contentSize
        return scroll
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 600)
    }
    
    let textNameLabel: UITextField = {
        let textL = UITextField()
        textL.text = "Основная информация"
        textL.font = .systemFont(ofSize: 18, weight: .medium)
        textL.tintColor = .black
        textL.frame = CGRect(x: 10, y: 10, width: 200, height: 30)
        return textL
    }()
    
    let button = UIButton()
    private lazy var restaurButton: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Выберите тип заведения"
        config.subtitle = "Ресторан,Гастробар"
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
            updated.font = UIFont.systemFont(ofSize: 20)
            updated.foregroundColor = UIColor.black
            return updated
        }
        if let image = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal) {
            config.image = image // Добавляем черное изображение
            config.imagePadding = 130                    // Отступ изображения от текста
            config.imagePlacement = .trailing           // Располагаем изображение слева от текста
        }
        // Присваиваем конфигурацию кнопке
        button.configuration = config
        button.frame = CGRect(x: 10, y: 50, width: 380, height: 60)
        button.addTarget(self, action: #selector(goToInfo), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        return button
    }()
        
    @objc private func goToInfo() {
        print("restaurant")
    }
     
    let button2 = UIButton()
    private lazy var choiceOfCuisineButtons: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Кухня"
        config.subtitle = "Японская, Грузинская"
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
            updated.font = UIFont.systemFont(ofSize: 20)
            updated.foregroundColor = UIColor.black
            return updated
        }
        if let image = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal) {
            config.image = image // Добавляем черное изображение
            config.imagePadding = 130                    // Отступ изображения от текста
            config.imagePlacement = .trailing           // Располагаем изображение слева от текста
        }
        // Присваиваем конфигурацию кнопке
        button2.configuration = config
        button2.frame = CGRect(x: 10, y: 130, width: 380, height: 60)
        button2.addTarget(self, action: #selector(goToInfoas), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button2)
        return button2
    }()
        
    @objc private func goToInfoas() {
        print("choice of cuisine")
    }
    
    
    let button3 = UIButton()
    private lazy var nameOfTheEstablishmentButtons: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Название заведения"
        config.subtitle = "FruitBunni"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 200)
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
            updated.font = UIFont.systemFont(ofSize: 20)
            updated.foregroundColor = UIColor.black
            return updated
        }
//        if let image = UIImage(systemName: "chevron.down")?.withTintColor(.black, renderingMode: .alwaysOriginal) {
//            config.image = image // Добавляем черное изображение
//            config.imagePadding = 130                    // Отступ изображения от текста
//            config.imagePlacement = .trailing           // Располагаем изображение слева от текста
//        }
        // Присваиваем конфигурацию кнопке
        button3.configuration = config
        button3.frame = CGRect(x: 10, y: 210, width: 380, height: 60)
        button3.addTarget(self, action: #selector(goToInfoas2), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button3)
        return button3
    }()
        
    @objc private func goToInfoas2() {
        print("nameOfTheEstablishmentButtons")
    }
    
    let button4 = UIButton()
    private lazy var nameTextButtons: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Описание"
        config.subtitle = "Винный бар ВИНОДЕР - это стильное, модное, и уютное место для людей, наслаждающихся жизнью и интересующихся винной культурой. Винная карта порадует вас своим изобилием и разнообразием - в ней более 500 позтций вина по цене розничного магазина, а также крепкий алкоголь, сидр и крафтовое пиво.                                           Меню наполнено легкими и здоровыми салатами, закусками, брускетками и мфсными нарезками, а также хамоном, импортной консервацией и многими другими блюдами, которые идеально дополняют барную карту"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 15, leading: 5, bottom: 20, trailing: 5)
        config.cornerStyle = .dynamic
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.lightGray
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 20)
            updated.foregroundColor = UIColor.black
            return updated
        }

        // Присваиваем конфигурацию кнопке
        button4.configuration = config
        button4.frame = CGRect(x: 10, y: 290, width: 380, height: 400)
        button4.addTarget(self, action: #selector(goToInfoas20), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button4)
        return button4
    }()
        
    @objc private func goToInfoas20() {
        print("choice of cuisine")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройка заведения"
        
        
       //scrollView.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(textNameLabel)
        scrollView.addSubview(restaurButton)
        scrollView.addSubview(choiceOfCuisineButtons)
        scrollView.addSubview(nameOfTheEstablishmentButtons)
        scrollView.addSubview(nameTextButtons)
    }
}
