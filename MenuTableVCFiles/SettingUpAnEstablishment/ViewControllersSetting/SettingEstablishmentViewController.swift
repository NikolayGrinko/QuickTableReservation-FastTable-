//
//  SettingEstablishmentViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 12.10.2024.
//
import UIKit

struct Photo {
    var image: UIImage
    var isFavorite: Bool = false
}

class SettingEstablishmentViewController: UIViewController, UICollectionViewDataSource, UIImagePickerControllerDelegate, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate, UICollectionViewDelegate {
    
    
    var isEditMode = false

    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.contentSize = contentSize
        return scroll
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 1300)
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
        let kitchen = SettingKitchenViewController()
        if let sheet = kitchen.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.preferredCornerRadius = 20
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        present(kitchen, animated: true)
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
        
        setupUI()
        addFiles()
        setupCollectionView()
    }
    
    // Контейнеры для хранения фото
    private var titlePhotos: [Photo] = []
    private var galleryPhotos: [Photo] = []
    
    // Переключатели режима редактирования
    private var isEditingTitle = false
    private var isEditingGallery = false
    
    // UI элементы
    private let titleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let galleryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.frame = CGRect(x: 10, y: 2030, width: 380, height: 60)
        button.layer.cornerRadius = 10
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray
        button.isHidden = true
        return button
    }()
    
    private let titlePencilButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 350, y: 1060, width: 30, height: 30)
        button.tintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        return button
    }()
    
    private let galleryPencilButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 350, y: 1560, width: 30, height: 30)
        button.tintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        return button
    }()
    
    // Настройка интерфейса
    private func setupUI() {
        view.backgroundColor = .white
    }
    
    // Создаем заголовки для контейнеров
    private func addFiles() {
        
        var titleLabel = UILabel()
        titleLabel = createLabel(withText: "Титульные фото")
        titleLabel.frame = CGRect(x: 10, y: 1050, width: 150, height: 20)
        titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 19)
        
        var titleFormatLabel = UILabel()
        titleFormatLabel = createLabel(withText: "От 1 до 10 фото в формате JPG, JPGE")
        titleFormatLabel.frame = CGRect(x: 10, y: 1080, width: 300, height: 20)
        titleFormatLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        titleFormatLabel.font = .systemFont(ofSize: 15)
        
        let galleryLabel = createLabel(withText: "Галерея")
        galleryLabel.frame = CGRect(x: 10, y: 1540, width: 150, height: 20)
        galleryLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        galleryLabel.font = .systemFont(ofSize: 19)
        
        let galleryFormatLabel = createLabel(withText: "От 1 до 10 фото в формате JPG, JPGE")
        galleryFormatLabel.frame = CGRect(x: 10, y: 1570, width: 300, height: 20)
        galleryFormatLabel.textColor = .lightGray
        galleryFormatLabel.font = .systemFont(ofSize: 15)
        
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(titleFormatLabel)
        
        scrollView.addSubview(galleryLabel)
        scrollView.addSubview(galleryFormatLabel)
        scrollView.addSubview(titleCollectionView)
        scrollView.addSubview(galleryCollectionView)
        scrollView.addSubview(titlePencilButton)
        scrollView.addSubview(galleryPencilButton)
        scrollView.addSubview(saveButton)
        
        // Назначаем действия для кнопок
        titlePencilButton.addTarget(self, action: #selector(toggleTitleEditing), for: .touchUpInside)
        galleryPencilButton.addTarget(self, action: #selector(toggleGalleryEditing), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(savePhotos), for: .touchUpInside)
        
    }
    // Настройка CollectionView
    private func setupCollectionView() {
        titleCollectionView.dataSource = self
        titleCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        galleryCollectionView.delegate = self
        
       
        
        titleCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        titleCollectionView.frame = CGRect(x: 10, y: 1120, width: 380, height: 400)
        titleCollectionView.contentInset = .init(top: 10, left: 5, bottom: 10, right: 10)
        titleCollectionView.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        titleCollectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        galleryCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
        galleryCollectionView.frame = CGRect(x: 10, y: 1610, width: 380, height: 400)
        galleryCollectionView.contentInset = .init(top: 10, left: 5, bottom: 10, right: 10)
        galleryCollectionView.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        galleryCollectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @objc private func toggleTitleEditing() {
        isEditingTitle.toggle()
        let newImage = isEditingTitle ? UIImage(systemName: "xmark") : UIImage(systemName: "pencil")
        titlePencilButton.setImage(newImage, for: .normal)
        titleCollectionView.reloadData()
    }
    
    @objc private func toggleGalleryEditing() {
        isEditingGallery.toggle()
        let newImage = isEditingGallery ? UIImage(systemName: "xmark") : UIImage(systemName: "pencil")
        galleryPencilButton.setImage(newImage, for: .normal)
        galleryCollectionView.reloadData()
    }
    
    @objc private func savePhotos() {
        // Логика сохранения фотографий
        saveButton.isHidden = true
    }
    
    // CollectionView DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == titleCollectionView {
            return titlePhotos.count + 1
        } else {
            return galleryPhotos.count + 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        let photos = collectionView == titleCollectionView ? titlePhotos : galleryPhotos
        if indexPath.item < photos.count {
            let photo = photos[indexPath.item]
            cell.configure(with: photo, isEditing: collectionView == titleCollectionView ? isEditingTitle : isEditingGallery)
            cell.deleteAction = { [weak self] in
                self?.deletePhoto(at: indexPath, in: collectionView)
            }
            cell.favoriteAction = { [weak self] in
                self?.toggleFavorite(at: indexPath, in: collectionView)
            }
        } else {
            cell.configureForAddPhoto()
            cell.addPhotoAction = { [weak self] in
                self?.openImagePicker(for: collectionView)
            }
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }

    
    // UIImagePickerControllerDelegate
    private func openImagePicker(for collectionView: UICollectionView) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            if titleCollectionView == picker.view.superview {
                titlePhotos.append(Photo(image: image))
                titleCollectionView.reloadData()
            } else {
                galleryPhotos.append(Photo(image: image))
                galleryCollectionView.reloadData()
            }
            saveButton.isHidden = false
        }
        picker.dismiss(animated: true, completion: nil)
    }

    private func deletePhoto(at indexPath: IndexPath, in collectionView: UICollectionView) {
        if collectionView == titleCollectionView {
            titlePhotos.remove(at: indexPath.item)
        } else {
            galleryPhotos.remove(at: indexPath.item)
        }
        collectionView.reloadData()
    }

    private func toggleFavorite(at indexPath: IndexPath, in collectionView: UICollectionView) {
        if collectionView == titleCollectionView {
            titlePhotos[indexPath.item].isFavorite.toggle()
        } else {
            galleryPhotos[indexPath.item].isFavorite.toggle()
        }
        collectionView.reloadData()
    }

    // Функция создания UILabel
    private func createLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }
}

