//
//  ScheduleCell.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 21.10.2024.
//

import UIKit

class ScheduleCell: UITableViewCell {

    let dayLabel = UILabel()
    let scheduleSwitch = UISwitch()
    let startTimePicker = UIDatePicker()
    let endTimePicker = UIDatePicker()
    let dashLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleSwitch.translatesAutoresizingMaskIntoConstraints = false
        startTimePicker.translatesAutoresizingMaskIntoConstraints = false
        endTimePicker.translatesAutoresizingMaskIntoConstraints = false
        dashLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(scheduleSwitch)
        contentView.addSubview(startTimePicker)
        contentView.addSubview(endTimePicker)
        contentView.addSubview(dashLabel)
        
        startTimePicker.datePickerMode = .time
        endTimePicker.datePickerMode = .time
        startTimePicker.isEnabled = false
        endTimePicker.isEnabled = false
        
        scheduleSwitch.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            // Day Label Constraints
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Switch Constraints
            scheduleSwitch.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            scheduleSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // Start Time Picker Constraints
            startTimePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 210),
            startTimePicker.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            dashLabel.widthAnchor.constraint(equalToConstant: 10),
            dashLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dashLabel.leadingAnchor.constraint(equalTo: startTimePicker.trailingAnchor, constant: 10),
            
            // End Time Picker Constraints
            endTimePicker.leadingAnchor.constraint(equalTo: dashLabel.trailingAnchor, constant: 10),
            endTimePicker.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
    }
    
    @objc func switchToggled() {
        let isEnabled = scheduleSwitch.isOn
        
        
        scheduleSwitch.onTintColor = .red
        
        startTimePicker.layer.borderWidth = scheduleSwitch.alpha == 0.0 ? 0 : 0.5
        
        startTimePicker.isEnabled = !isEnabled
        
        startTimePicker.isEnabled = isEnabled
        endTimePicker.isEnabled = isEnabled
        contentView.backgroundColor = isEnabled ? .white : .white
        dayLabel.textColor = isEnabled ? .black : .darkGray
   
        startTimePicker.layer.borderColor = UIColor.black.cgColor
        startTimePicker.layer.borderWidth = 1
        startTimePicker.layer.cornerRadius = 10
        
        startTimePicker.layer.borderColor = isEnabled ? UIColor.black.cgColor : UIColor.systemGray6.cgColor
        
        endTimePicker.layer.borderColor = isEnabled ? UIColor.black.cgColor : UIColor.systemGray6.cgColor
        
        endTimePicker.layer.borderWidth = 1
        endTimePicker.layer.cornerRadius = 10
        
        dashLabel.backgroundColor = .white
        dashLabel.text = "—"
    }
}

