//
//  BasicViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 12.11.2024.
//

import UIKit

class BasicViewController: UIViewController {

    let button = UIButton()
    private lazy var basicButtons: UIButton = {
        // Настраиваем конфигурацию кнопки
        var config = UIButton.Configuration.gray()
        // Задаем текст для title и subtitle
        config.subtitle = "Back"
        config.baseBackgroundColor = .systemGray6
        config.buttonSize = .medium
        config.imagePlacement = .trailing
        config.titleAlignment = .leading
        config.contentInsets = .init(top: 5, leading: 7, bottom: 5, trailing: 7)
        config.cornerStyle = .large
        config.subtitleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var updated = incoming
            updated.font = UIFont.systemFont(ofSize: 16)
            updated.foregroundColor = UIColor.blue
            return updated
        }
//        if let image = UIImage(named: "tochka")?.withTintColor(.white, renderingMode: .alwaysOriginal) {
//            config.image = image // Добавляем черное изображение
//            config.imagePadding = 10                    // Отступ изображения от текста
//            config.imagePlacement = .trailing           // Располагаем изображение слева от текста
//        }
        // Присваиваем конфигурацию кнопке
        button.configuration = config
        button.frame = CGRect(x: 10, y: 50, width: 50, height: 40)
        button.addTarget(self, action: #selector(goToInfo), for: .touchUpInside)
        // Добавляем кнопку на экран (пример для ViewController)
        view.addSubview(button)
        return button
    }()
    
    @objc private func goToInfo() {
        print("restaurant")
        let restaurant = HallLayoutViewController()
        restaurant.modalPresentationStyle = .custom
        //navigationController?.pushViewController(restaurant, animated: true)
        present(restaurant, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(basicButtons)
    }
}
