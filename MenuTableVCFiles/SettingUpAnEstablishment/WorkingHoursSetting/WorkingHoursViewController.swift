//
//  WorkingHoursViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 21.10.2024.
//

import UIKit

class WorkingHoursViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let nameLabel = UILabel()
    let tableView = UITableView()
    let saveButton = UIButton()
    let applyLabel = UILabel()
    let daysOfWeek = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
    let applyLabel1 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Время работы"
        setupTableView()
        setupSaveButton()
        setupApplyLabel()
        setupApplyLabel1()
        nameTextLabel()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ScheduleCell.self, forCellReuseIdentifier: "ScheduleCell")
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    func nameTextLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Основной график работы"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        nameLabel.textAlignment = .left
        nameLabel.isUserInteractionEnabled = true
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupSaveButton() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = .red
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
    }
    
    func setupApplyLabel() {
        applyLabel.translatesAutoresizingMaskIntoConstraints = false
        applyLabel.text = "Применить ко всем"
        applyLabel.textColor = .red
        applyLabel.font = .systemFont(ofSize: 13)
        applyLabel.textAlignment = .right
        applyLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(applyToAllTapped))
        applyLabel.addGestureRecognizer(tapGesture)
        tableView.addSubview(applyLabel)
        
        NSLayoutConstraint.activate([
            applyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
            applyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            applyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    func setupApplyLabel1() {
        applyLabel1.translatesAutoresizingMaskIntoConstraints = false
        applyLabel1.text = "--------------------------"
        applyLabel1.textColor = .red
        applyLabel1.font = .systemFont(ofSize: 10)
        applyLabel1.textAlignment = .right
        applyLabel1.isUserInteractionEnabled = true
        //let tapGesture = UITapGestureRecognizer(target: self, action: #selector(applyToAllTapped))
        //applyLabel.addGestureRecognizer(tapGesture)
        tableView.addSubview(applyLabel1)
        
        NSLayoutConstraint.activate([
            applyLabel1.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            applyLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            applyLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            applyLabel1.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    @objc func applyToAllTapped() {
        if let firstCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ScheduleCell {
            let startTime = firstCell.startTimePicker.date
            let endTime = firstCell.endTimePicker.date
            
            for row in 1..<daysOfWeek.count {
                if let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? ScheduleCell {
                    cell.startTimePicker.setDate(startTime, animated: true)
                    cell.endTimePicker.setDate(endTime, animated: true)
                }
            }
        }
    }

    // TableView Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysOfWeek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleCell
        cell.dayLabel.text = daysOfWeek[indexPath.row]
        return cell
    }
    
    @objc func saveButtonTapped() {
        var scheduleData: [[String: Any]] = []
        
        for row in 0..<daysOfWeek.count {
            if let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? ScheduleCell, cell.scheduleSwitch.isOn {
                let startTime = cell.startTimePicker.date
                let endTime = cell.endTimePicker.date
                let daySchedule: [String: Any] = [
                    "day": daysOfWeek[row],
                    "startTime": startTime,
                    "endTime": endTime
                ]
                scheduleData.append(daySchedule)
            }
        }
        
        // Пример сохранения данных в UserDefaults или отправка на сервер
        print("Сохраненные данные: \(scheduleData)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
