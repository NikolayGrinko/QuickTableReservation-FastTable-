//
//  SettingEstablViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 15.10.2024.
//

import UIKit

struct TodoRes {
    var title: String
    var isMarked: Bool
}

class SettingEstablViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let toDo = RestauranSettingTableViewCell()
    
    let toDoTableView = UITableView(frame: CGRect(x: 0, y: 50, width: 400, height: 300))
    
    var todos = [TodoRes(title: "Ресторан", isMarked: false),
                 TodoRes(title: "Ресторан", isMarked: false),
                 TodoRes(title: "Ресторан", isMarked: false),
                 TodoRes(title: "Ресторан", isMarked: true),
                 TodoRes(title: "Ресторан", isMarked: false)]
    
    let identifier = "RestauranSettTableViewCell"
    // let popUpView = PopUpViewUIView()
    let tableView = UITableView()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.text = "Выберите тип заведения"
        label.frame = CGRect(x: 20, y: 30, width: 200, height: 20)
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    
    lazy var chooseTapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Сохранить", for: .normal)
        button.frame = CGRect(x: 20, y: 320, width: 360, height: 50)
        button.backgroundColor = .red
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        return button
    }()
    
    @objc func dismissAlert() {
        self.dismiss(animated: false)
        self.removeFromParent()
    }
    
    lazy var nextTapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Отмена", for: .normal)
        button.frame = CGRect(x: 20, y: 380, width: 360, height: 50)
        button.backgroundColor = .lightGray
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(nextDismissAlert), for: .touchUpInside)
        return button
    }()
    
    @objc func nextDismissAlert() {
        self.dismiss(animated: false)
        self.removeFromParent()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .systemGray6
        view.backgroundColor = .systemGray6
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        // Минимальная высота ячейки (если требуется)
        tableView.estimatedRowHeight = 44.0
        view.addSubview(nextTapButton)
        view.addSubview(labelName)
       //view.addSubview(closeTapButton)
        view.addSubview(chooseTapButton)
        
        view.addSubview(tableView)
        
        tableView.frame = CGRect(x: 10, y: 70, width: view.frame.width - 20, height: view.frame.height / 3 - 40)
        tableView.register(RestauranSettingTableViewCell.self, forCellReuseIdentifier: identifier)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RestauranSettingTableViewCell
        
        let todo = todos[indexPath.row]
        
        cell.titleNameLabel.text = todo.title
        cell.imagesViewTap.image = todo.isMarked == true ? UIImage(named: "красный") : UIImage(named: "серый")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let cell = tableView.cellForRow(at: indexPath) as? RestauranSettingTableViewCell else { return }
        
        var todo = todos[indexPath.row]
        
        todo.isMarked = !todo.isMarked
        todos.remove(at: indexPath.row)
        todos.insert(todo, at: indexPath.row)
        
        cell.imagesViewTap.image = todo.isMarked ? UIImage(named: "красный") : UIImage(named: "серый")
    }
    
}
