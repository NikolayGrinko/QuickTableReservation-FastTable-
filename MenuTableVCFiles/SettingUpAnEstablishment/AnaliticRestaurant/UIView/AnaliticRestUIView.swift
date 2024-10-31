//
//  AnaliticRestUIView.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 01.11.2024.
//

import UIKit

class AnaliticRestUIView: UIView {
    
    
    // func add1() {
    let datePeriodLabel: UILabel = {
        let datePeriodLabel = UILabel()
        datePeriodLabel.text = "Дата / Период."
        datePeriodLabel.font = .systemFont(ofSize: 13)
        datePeriodLabel.frame = CGRect(x: 10, y: 120, width: 150, height: 20)
        return datePeriodLabel
    }()
    
    let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = "1–15 фев."
        dateLabel.textColor = .red
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.frame = CGRect(x: 300, y: 120, width: 100, height: 20)
        return dateLabel
    }()
        
    let viewLastLabel: UIView = {
        let viewLastLabel = UIView()
        viewLastLabel.frame = CGRect(x: 0, y: 155, width: 380, height: 30)
        viewLastLabel.backgroundColor = .systemGray4
        return viewLastLabel
    }()
    
    
    let lastUpdateLabel: UILabel = {
        let lastUpdateLabel = UILabel()
        lastUpdateLabel.text = "🕝  Последнее обновление: сегодня в 16:00"
        lastUpdateLabel.frame = CGRect(x: 10, y: 5, width: 370, height: 20)
        lastUpdateLabel.font = .systemFont(ofSize: 13)
        lastUpdateLabel.textAlignment = .center
        lastUpdateLabel.textColor = .lightGray
        return lastUpdateLabel
    }()
    
    
    let viewGrandReserve: UIView = {
        let viewGrandReserve = UIView(frame: CGRect(x: 10, y: 195, width: 380, height: 90))
        viewGrandReserve.layer.cornerRadius = 20
        viewGrandReserve.backgroundColor = .white
        return viewGrandReserve
    }()
        
    let visitsLabel: UILabel = {
        let visitsLabel = UILabel()
        visitsLabel.text = "Посещения"
        visitsLabel.font = .systemFont(ofSize: 16)
        visitsLabel.textColor = .black
        visitsLabel.frame = CGRect(x: 10, y: 15, width: 100, height: 20)
        return visitsLabel
    }()
    
    
    let visitsNumberLabel: UILabel = {
        let visitsNumberLabel = UILabel()
        visitsNumberLabel.text = "13"
        visitsNumberLabel.font = .systemFont(ofSize: 26)
        visitsNumberLabel.textColor = .black
        visitsNumberLabel.frame = CGRect(x: 10, y: 30, width: 100, height: 50)
        return visitsNumberLabel
    }()
        
    let reservationsLabel: UILabel = {
        let reservationsLabel = UILabel()
        reservationsLabel.text = "Резервы"
        reservationsLabel.font = .systemFont(ofSize: 16)
        reservationsLabel.textColor = .black
        reservationsLabel.frame = CGRect(x: 110, y: 15, width: 100, height: 20)
        return reservationsLabel
    }()
        
    
    let reservationsNumberLabel: UILabel = {
        let reservationsNumberLabel = UILabel()
        reservationsNumberLabel.text = "23"
        reservationsNumberLabel.font = .systemFont(ofSize: 26)
        reservationsNumberLabel.textColor = .black
        reservationsNumberLabel.frame = CGRect(x: 110, y: 30, width: 50, height: 50)
        return reservationsNumberLabel
    }()
        
        
    let reservationsProcentLabel: UILabel = {
        let reservationsProcentLabel = UILabel()
        reservationsProcentLabel.text = "23.2%"
        reservationsProcentLabel.font = .systemFont(ofSize: 12)
        reservationsProcentLabel.textColor = .red
        reservationsProcentLabel.frame = CGRect(x: 145, y: 45, width: 60, height: 10)
        return reservationsProcentLabel
    }()
        
        
    let reservationsVisitsLabel2: UILabel = {
        let reservationsVisitsLabel2 = UILabel()
        reservationsVisitsLabel2.text = "от посещений"
        reservationsVisitsLabel2.font = .systemFont(ofSize: 11)
        reservationsVisitsLabel2.textColor = .systemGray3
        reservationsVisitsLabel2.frame = CGRect(x: 145, y: 55, width: 90, height: 10)
        return reservationsVisitsLabel2
    }()
        
        
    let viewAddReserve: UIView = {
        let viewAddReserve = UIView(frame: CGRect(x: 240, y: 15, width: 120, height: 55))
        viewAddReserve.backgroundColor = .systemGray3
        return viewAddReserve
    }()
        
        
    let viewTimervisit: UIView = {
        let viewTimervisit = UIView(frame: CGRect(x: 10, y: 295, width: 380, height: 90))
        viewTimervisit.backgroundColor = .systemGray3
        viewTimervisit.backgroundColor = .white
        viewTimervisit.layer.cornerRadius = 20
        return viewTimervisit
    }()
        
        
    let averageTimeLabel: UILabel = {
        let averageTimeLabel = UILabel(frame: CGRect(x: 80, y: 10, width: 220, height: 30))
        averageTimeLabel.text = "Среднее время посещений"
        averageTimeLabel.font = .systemFont(ofSize: 16)
        averageTimeLabel.textAlignment = .center
        averageTimeLabel.textColor = .black
        return averageTimeLabel
    }()
        
    
    let averageNumberLabel: UILabel = {
        let averageNumberLabel = UILabel(frame: CGRect(x: 130, y: 40, width: 120, height: 40))
        averageNumberLabel.text = "47 мин"
        averageNumberLabel.font = .systemFont(ofSize: 24)
        averageNumberLabel.textAlignment = .center
        averageNumberLabel.textColor = .systemGreen
        return averageNumberLabel
    }()
   
    
    let viewGraphic: UIView = {
        let viewGraphic = UIView(frame: CGRect(x: 10, y: 400, width: 380, height: 300))
        viewGraphic.backgroundColor = .white
        viewGraphic.layer.cornerRadius = 15
        return viewGraphic
    }()
        
    
    let averageDynamicLabel: UILabel = {
        let averageDynamicLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 100, height: 20))
        averageDynamicLabel.text = "Динамика"
        averageDynamicLabel.font = .systemFont(ofSize: 16)
        averageDynamicLabel.textAlignment = .left
        averageDynamicLabel.textColor = .black
        return averageDynamicLabel
    }()
        
    
    func dinamicGraphic() {
        let visitsPath = UIBezierPath()
        visitsPath.move(to: CGPoint(x: 0, y: 100))
        visitsPath.addLine(to: CGPoint(x: 50, y: 50))
        visitsPath.addLine(to: CGPoint(x: 100, y: 150))
        
        let visitsLayer = CAShapeLayer()
        visitsLayer.path = visitsPath.cgPath
        visitsLayer.strokeColor = UIColor.red.cgColor
        visitsLayer.lineWidth = 2.0
        visitsLayer.fillColor = UIColor.clear.cgColor
        viewGraphic.layer.addSublayer(visitsLayer)
       
  }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dinamicGraphic()
        
        addSubview(viewGraphic)
        addSubview(viewTimervisit)
        addSubview(viewGrandReserve)
        addSubview(datePeriodLabel)
        addSubview(dateLabel)
        addSubview(viewLastLabel)
        addSubview(lastUpdateLabel)
        
        viewGraphic.addSubview(averageDynamicLabel)
        viewTimervisit.addSubview(averageNumberLabel)
        viewTimervisit.addSubview(averageTimeLabel)
        viewGrandReserve.addSubview(viewAddReserve)
        viewGrandReserve.addSubview(reservationsVisitsLabel2)
        viewGrandReserve.addSubview(reservationsNumberLabel)
        viewGrandReserve.addSubview(reservationsProcentLabel)
        viewGrandReserve.addSubview(reservationsLabel)
        viewGrandReserve.addSubview(visitsNumberLabel)
        viewGrandReserve.addSubview(visitsLabel)
        
        viewLastLabel.addSubview(lastUpdateLabel)
       
        
       // add1()
       // viewThreeElement()
      //  dinamicaGraphic()
       // daysOw()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

