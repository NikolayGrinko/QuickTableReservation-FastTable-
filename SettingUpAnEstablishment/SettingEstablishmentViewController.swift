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
    
    let textContactLabel: UITextField = {
        let textL = UITextField()
        textL.text = "Контактная информация"
        textL.font = .systemFont(ofSize: 20, weight: .medium)
        textL.tintColor = .black
        textL.frame = CGRect(x: 10, y: 710, width: 250, height: 30)
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
    
    
    let button5 = UIButton()
    private lazy var contactInfoButton: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Телефон заведения"
        config.subtitle = "+7 915 964 71-06"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 230)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 13)
            updated.foregroundColor = UIColor.lightGray
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.black
            return updated
        }
        // Присваиваем конфигурацию кнопке
        button5.configuration = config
        button5.frame = CGRect(x: 10, y: 750, width: 380, height: 60)
        button5.addTarget(self, action: #selector(contactInfo), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button5)
        return button5
    }()
        
    @objc private func contactInfo() {
        print("contactInfo")
    }
    
    let button6 = UIButton()
    private lazy var nameCityButton: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Город заведения"
        config.subtitle = "Ярославль"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 250)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 13)
            updated.foregroundColor = UIColor.lightGray
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.black
            return updated
        }
        // Присваиваем конфигурацию кнопке
        button6.configuration = config
        button6.frame = CGRect(x: 10, y: 820, width: 380, height: 60)
        button6.addTarget(self, action: #selector(nameCity), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button6)
        return button6
    }()
        
    @objc private func nameCity() {
        print("contactInfo")
    }
    
    let button7 = UIButton()
    private lazy var addressOfTheEstablishmentButton: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Адрес заведения"
        config.subtitle = "Лисицина 2А"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 250)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 13)
            updated.foregroundColor = UIColor.lightGray
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.black
            return updated
        }
        // Присваиваем конфигурацию кнопке
        button7.configuration = config
        button7.frame = CGRect(x: 10, y: 890, width: 380, height: 60)
        button7.addTarget(self, action: #selector(addressOfTheEstablishment), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button7)
        return button7
    }()
        
    @objc private func addressOfTheEstablishment() {
        print("addressOfTheEstablishment")
    }
    
    
    let button8 = UIButton()
    private lazy var addressRegionButton: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Регион/область"
        config.subtitle = "Ярославская область"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 16)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 13)
            updated.foregroundColor = UIColor.lightGray
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.black
            return updated
        }
        // Присваиваем конфигурацию кнопке
        button8.configuration = config
        button8.frame = CGRect(x: 10, y: 960, width: 185, height: 60)
        button8.addTarget(self, action: #selector(addressRegion), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button8)
        return button8
    }()
        
    @objc private func addressRegion() {
        print("addressRegion")
    }
    
    
    let button9 = UIButton()
    private lazy var indexRegionButton: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.title = "Индекс"
        config.subtitle = "150054"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 120)
        config.cornerStyle = .large
        // Настраиваем стили для title и subtitle
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 13)
            updated.foregroundColor = UIColor.lightGray
            return updated
        }
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 15)
            updated.foregroundColor = UIColor.black
            return updated
        }
        // Присваиваем конфигурацию кнопке
        button9.configuration = config
        button9.frame = CGRect(x: 200, y: 960, width: 190, height: 60)
        button9.addTarget(self, action: #selector(indexRegion), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
       // button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button9)
        return button9
    }()
        
    @objc private func indexRegion() {
        print("addressRegion")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройка заведения"
        
        view.addSubview(scrollView)
        scrollView.addSubview(textNameLabel)
        scrollView.addSubview(restaurButton)
        scrollView.addSubview(choiceOfCuisineButtons)
        scrollView.addSubview(nameOfTheEstablishmentButtons)
        scrollView.addSubview(nameTextButtons)
        scrollView.addSubview(textContactLabel)
        scrollView.addSubview(contactInfoButton)
        scrollView.addSubview(nameCityButton)
        scrollView.addSubview(addressOfTheEstablishmentButton)
        scrollView.addSubview(addressRegionButton)
        scrollView.addSubview(indexRegionButton)
    }
}
