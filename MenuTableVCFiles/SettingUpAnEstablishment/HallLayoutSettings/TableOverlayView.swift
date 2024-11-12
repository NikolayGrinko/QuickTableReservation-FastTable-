//
//  TableOverlayView.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 12.11.2024.
//


import UIKit

protocol TableOverlayDelegate: AnyObject {
    func didAddTable(_ table: UIView)
}

class TableOverlayView: UIView {
    
    weak var delegate: TableOverlayDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // backgroundColor = UIColor(white: 0, alpha: 0.7)
        backgroundColor = .systemGray6
        setupLabel()
        setupTableButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        let titleLabel = UILabel()
        titleLabel.text = "Перетащите созданные столы и схему зала"
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            // titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupTableButtons() {
        let tableTypes = ["Круглый", "Квадратный", "Прямоугольный", "Овальный"]
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        for type in tableTypes {
            let button = UIButton(type: .system)
            button.setTitle(type, for: .normal)
            button.backgroundColor = .green
            button.addTarget(self, action: #selector(tableTapped), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    @objc private func tableTapped(_ sender: UIButton) {
        let newTable = UIView()
        newTable.backgroundColor = .green
        newTable.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        newTable.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
        delegate?.didAddTable(newTable)
        isHidden = true
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        guard let tableView = gesture.view else { return }
        
        let translation = gesture.translation(in: superview)
       // tableView.trailingAnchor.constraint(equalTo: superview?.trailingAnchor, constant: translation.dictionaryRepresentation["x"] ?? 0).isActive = true
        tableView.center = CGPoint(x: tableView.center.x + translation.x, y: tableView.center.y + translation.y)
        gesture.setTranslation(.zero, in: superview)
    }
}
