//
//  SettingEstablishmentViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 12.10.2024.
//

import UIKit

class SettingEstablishmentViewController: UIViewController, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate {
    
    
    //var addButton: UIButton!
    //var saveButton: UIButton!
    // var editModeButton: UIButton!
    var isEditMode = false
    var photos: [PhotoTitul] = []
    
    
//    var collectionViewGallery: UICollectionView!
//    var addButtonGallery: UIButton!
//    var saveButtonGallery: UIButton!
//    var editModeButtonGallery: UIButton!
//    var isEditModeGallery = false
//    var photoTutul: [PhotoGallery] = []
    
    
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
        collectionViewTitul.delegate = self
        collectionViewTitul.dataSource = self
       // configureTitulUI()
        
        
        
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
        
        scrollView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(saveSizeLabel)
        containerView.addSubview(collectionViewTitul)
        collectionViewTitul.addSubview(addButton)
        containerView.addSubview(saveButton)
        containerView.addSubview(editModeButton)
    }
    
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.frame = CGRect(x: 10, y: 1040, width: 380, height: 400)
        containerView.backgroundColor = #colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)
        containerView.layer.cornerRadius = 10
        return containerView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Титульные фото"
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        nameLabel.textColor = .black
        nameLabel.frame = CGRect(x: 5, y: 10, width: 200, height: 20)
        return nameLabel
    }()
    
    let saveSizeLabel: UILabel = {
        let saveSizeLabel = UILabel()
        saveSizeLabel.text = "От 1 до 10 фото в формате JPG,JPGE"
        saveSizeLabel.font = .systemFont(ofSize: 12, weight: .regular)
        saveSizeLabel.textColor = .systemGray
        saveSizeLabel.frame = CGRect(x: 5, y: 35, width: 230, height: 20)
        return saveSizeLabel
    }()
    
    // Initialize collectionView
    var collectionViewTitul: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        var collectionViewTitul2 = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 100, height: 100)
        collectionViewTitul2.frame = CGRect(x: 5, y: 70, width: 360, height: 250)
        collectionViewTitul2.backgroundColor = #colorLiteral(red: 0.9490190148, green: 0.9490202069, blue: 0.9748199582, alpha: 1)
        collectionViewTitul2.register(TitulPhotoCollViewCell.self, forCellWithReuseIdentifier: "TitulPhotoCollViewCell")
        return collectionViewTitul2
    }()
    //Add button for adding photos (initially in the first cell)
    lazy var addButton: UIButton = {
        var addButton = UIButton(type: .custom)
        addButton.setImage(UIImage(systemName: "camera"), for: .normal)
        addButton.frame = CGRect(x: 5, y: 5, width: 100, height: 100)
        addButton.tintColor = #colorLiteral(red: 0.9072304038, green: 0.9072304038, blue: 0.9072304038, alpha: 1)
        addButton.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
        return addButton
    }()
    
    // Save button (hidden initially)
    lazy var saveButton: UIButton = {
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = #colorLiteral(red: 0.8862745166, green: 0.8862745166, blue: 0.8862745166, alpha: 1)
        saveButton.tintColor = .black
        saveButton.layer.cornerRadius = 10
        saveButton.frame = CGRect(x: 10, y: 350, width: 350, height: 40)
        saveButton.isHidden = true
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return saveButton
    }()
    
    // Edit Mode button
    lazy var editModeButton: UIButton = {
        editModeButton = UIButton(type: .system)
        editModeButton.backgroundColor = #colorLiteral(red: 0.9995579123, green: 0.8042607903, blue: 0.82557863, alpha: 1)
        editModeButton.tintColor = .red
        editModeButton.layer.cornerRadius = 5
        editModeButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editModeButton.frame = CGRect(x: 340, y: 20, width: 30, height: 30)
        editModeButton.addTarget(self, action: #selector(toggleEditMode), for: .touchUpInside)
        return editModeButton
    }()
    
    @objc func addPhotoButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func saveButtonTapped() {
        // Save photos logic
        saveButton.isHidden = true
        isEditMode = false
        editModeButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        collectionViewTitul.reloadData()
    }
    
    @objc func toggleEditMode() {
        isEditMode.toggle()
        let icon = isEditMode ? "xmark" : "pencil"
        editModeButton.setImage(UIImage(systemName: icon), for: .normal)
        collectionViewTitul.reloadData()
    }
    
    // Handle image selection
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            let newPhoto = PhotoTitul(image: image, isFavorite: false)
            photos.append(newPhoto)
            collectionViewTitul.reloadData()
            saveButton.isHidden = false // Show save button when a new photo is added
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    // UICollectionView DataSource methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count + 1 // Additional cell for the "add photo" button
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == photos.count {
            // The last cell for adding photos
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitulPhotoCollViewCell", for: indexPath) as! TitulPhotoCollViewCell
            cell.imageView.image = UIImage(systemName: "camera")
            cell.imageView.tintColor = .systemGray4
            cell.backgroundColor = .systemGray5
            cell.imageView.layer.cornerRadius = 10
            cell.layer.cornerRadius = 10
            cell.favoriteButton.isHidden = true
            cell.deleteButton.isHidden = true
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TitulPhotoCollViewCell", for: indexPath) as! TitulPhotoCollViewCell
            let photo = photos[indexPath.row]
            cell.layer.cornerRadius = 10
            cell.imageView.image = photo.image
            cell.favoriteIcon.isHidden = !photo.isFavorite
            cell.imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell.imageView.layer.cornerRadius = 10
            cell.deleteButton.tag = indexPath.row
            cell.favoriteButton.tag = indexPath.row
            cell.deleteButton.addTarget(self, action: #selector(deletePhoto), for: .touchUpInside)
            cell.favoriteButton.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
            // Show delete and favorite buttons only in edit mode
            cell.favoriteButton.isHidden = !isEditMode
            cell.deleteButton.isHidden = !isEditMode
            return cell
        }
    }
    
    @objc func deletePhoto(sender: UIButton) {
        photos.remove(at: sender.tag)
        collectionViewTitul.reloadData()
        if photos.isEmpty {
            saveButton.isHidden = true // Hide save button if no photos
        }
    }
    
    @objc func toggleFavorite(sender: UIButton) {
        let index = sender.tag
        photos[index].isFavorite.toggle()
        collectionViewTitul.reloadData()
    }
    
    
    
    
//    
//    func configureGalleryUI() {
//        // Layout for collectionView
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 100, height: 100)
//        
//        let containerView = UIView()
//                containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
//                containerView.layer.cornerRadius = 10
//                view.addSubview(containerView)
//        
//        let nameLabel = UILabel()
//        nameLabel.text = "Титульные фото"
//        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
//        nameLabel.textColor = .black
//        nameLabel.frame = CGRect(x: 5, y: 10, width: 200, height: 20)
//        containerView.addSubview(nameLabel)
//        
//        let saveSizeLabel = UILabel()
//        saveSizeLabel.text = "От 1 до 10 фото в формате JPG,JPGE"
//        saveSizeLabel.font = .systemFont(ofSize: 12, weight: .regular)
//        saveSizeLabel.textColor = .systemGray
//        saveSizeLabel.frame = CGRect(x: 5, y: 35, width: 230, height: 20)
//        containerView.addSubview(saveSizeLabel)
//                                 
//                                 
//        // Initialize collectionView
//        collectionViewGallery = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionViewGallery.translatesAutoresizingMaskIntoConstraints = false
//        collectionViewGallery.delegate = self
//        collectionViewGallery.dataSource = self
//        collectionViewGallery.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
//        collectionViewGallery.register(GalleryPhotoCollViewCell.self, forCellWithReuseIdentifier: "GalleryPhotoCollViewCell")
//        containerView.addSubview(collectionViewGallery)
//        
//         //Add button for adding photos (initially in the first cell)
//        addButtonGallery = UIButton(type: .custom)
//        addButtonGallery.setImage(UIImage(systemName: "camera"), for: .normal)
//        addButtonGallery.frame = CGRect(x: 5, y: 5, width: 100, height: 100)
//        addButtonGallery.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        //addButton.translatesAutoresizingMaskIntoConstraints = false
//        addButtonGallery.addTarget(self, action: #selector(addPhotoButtonTappedGallery), for: .touchUpInside)
//        //collectionView.addSubview(addButton)
//        collectionViewGallery.addSubview(addButtonGallery)
//       
//        // Save button (hidden initially)
//        
//        saveButtonGallery = UIButton(type: .system)
//        saveButtonGallery.setTitle("Сохранить", for: .normal)
//        saveButtonGallery.backgroundColor = .gray
//        saveButtonGallery.layer.cornerRadius = 10
//        saveButtonGallery.translatesAutoresizingMaskIntoConstraints = false
//        saveButtonGallery.isHidden = true
//        saveButtonGallery.addTarget(self, action: #selector(saveButtonTappedGallery), for: .touchUpInside)
//        containerView.addSubview(saveButton)
//        
//        // Edit Mode button
//        editModeButtonGallery = UIButton(type: .system)
//        editModeButtonGallery.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.5363270761, blue: 0.488931597, alpha: 1)
//        editModeButtonGallery.tintColor = .red
//        editModeButtonGallery.setImage(UIImage(systemName: "pencil"), for: .normal)
//        editModeButtonGallery.translatesAutoresizingMaskIntoConstraints = false
//        editModeButtonGallery.addTarget(self, action: #selector(toggleEditModeGallery), for: .touchUpInside)
//        containerView.addSubview(editModeButtonGallery)
//        
//        // Constraints
//        NSLayoutConstraint.activate([
////            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1700),
////            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
////            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
////            containerView.heightAnchor.constraint(equalToConstant: 400),
//            
//            collectionViewGallery.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 80),
//            collectionViewGallery.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            collectionViewGallery.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
//            collectionViewGallery.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -10),
//            
//            saveButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            saveButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//            saveButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
//            saveButton.heightAnchor.constraint(equalToConstant: 50),
//            
//            editModeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
//            editModeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10)
//        ])
//    }
//    
//    @objc func addPhotoButtonTappedGallery() {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = .photoLibrary
//        present(imagePicker, animated: true, completion: nil)
//    }
//    
//    @objc func saveButtonTappedGallery() {
//        // Save photos logic
//        saveButton.isHidden = true
//        isEditMode = false
//        editModeButton.setImage(UIImage(systemName: "pencil"), for: .normal)
//        collectionViewGallery.reloadData()
//    }
//    
//    @objc func toggleEditModeGallery() {
//        isEditMode.toggle()
//        let icon = isEditMode ? "xmark" : "pencil"
//        editModeButton.setImage(UIImage(systemName: icon), for: .normal)
//        collectionViewGallery.reloadData()
//    }
//    
//    // Handle image selection
//    func imagePickerControllerGallery(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[.originalImage] as? UIImage {
//            let newPhoto = PhotoGallery(image: image, isFavorite: false)
//            photoTutul.append(newPhoto)
//            collectionViewGallery.reloadData()
//            saveButton.isHidden = false // Show save button when a new photo is added
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
//    
//    // UICollectionView DataSource methods
//    func collectionViewGallery(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photos.count + 1 // Additional cell for the "add photo" button
//    }
//    
//    func collectionViewGallery(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if indexPath.row == photos.count {
//            // The last cell for adding photos
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryPhotoCollViewCell", for: indexPath) as! GalleryPhotoCollViewCell
//            cell.imageView.image = UIImage(systemName: "camera")
////            cell.imageView.frame.size.width = 30
////            cell.imageView.frame.size.height = 30
//            cell.imageView.tintColor = .systemGray4
//            cell.backgroundColor = .systemGray5
//            cell.imageView.layer.cornerRadius = 20
//            cell.layer.cornerRadius = 20
//            cell.favoriteButton.isHidden = true
//            cell.deleteButton.isHidden = true
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryPhotoCollViewCell", for: indexPath) as! GalleryPhotoCollViewCell
//            let photo = photos[indexPath.row]
//            cell.layer.cornerRadius = 20
//            cell.imageView.image = photo.image
//            cell.favoriteIcon.isHidden = !photo.isFavorite
//            cell.imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//            cell.imageView.layer.cornerRadius = 20
//            cell.deleteButton.tag = indexPath.row
//            cell.favoriteButton.tag = indexPath.row
//            cell.deleteButton.addTarget(self, action: #selector(deletePhoto), for: .touchUpInside)
//            cell.favoriteButton.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
//            
//            // Show delete and favorite buttons only in edit mode
//            cell.favoriteButton.isHidden = !isEditMode
//            cell.deleteButton.isHidden = !isEditMode
//            return cell
//        }
//    }
//    
//    @objc func deletePhotoGallery(sender: UIButton) {
//        photos.remove(at: sender.tag)
//        collectionViewGallery.reloadData()
//        if photos.isEmpty {
//            saveButton.isHidden = true // Hide save button if no photos
//        }
//    }
//    
//    @objc func toggleFavoriteGallery(sender: UIButton) {
//        let index = sender.tag
//        photos[index].isFavorite.toggle()
//        collectionViewGallery.reloadData()
//    }
//    
//    
}
