//
//  AnaliticRestaurantViewController.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 01.11.2024.
//

import UIKit

class AnaliticRestaurantViewController: UIViewController {
    
    let analiticRest = AnaliticRestUIView()
//    let scroll = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationItem.title = "Аналитика ресторана"
        view.addSubview(analiticRest)
    }
    
    
    // Similarly, create paths for "Reservations" and "Advertisements"
    
    private func daysOw() {
        let daysOfWeek = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
        
        for (index, day) in daysOfWeek.enumerated() {
            let barHeight = CGFloat(arc4random_uniform(80)) // Random value for example purposes
            let barPath = UIBezierPath(rect: CGRect(x: 50 * index, y: 100, width: 30, height: Int(barHeight)))
            
            let barLayer = CAShapeLayer()
            barLayer.path = barPath.cgPath
            barLayer.fillColor = UIColor.green.cgColor
            view.layer.addSublayer(barLayer)
            
            
            
            let timeSlots = ["00:00", "03:00", "06:00", "09:00", "12:00", "15:00", "18:00", "21:00"]
            
            for (index, time) in timeSlots.enumerated() {
                let barHeight = CGFloat(arc4random_uniform(80)) // Random value for example purposes
                let barPath = UIBezierPath(rect: CGRect(x: 50 * index, y: 100, width: 30, height: Int(barHeight)))
                
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.green.cgColor
                view.layer.addSublayer(barLayer)
            }
            
            let center = CGPoint(x: 100, y: 100)
            let radius: CGFloat = 50
            let startAngle = CGFloat(0)
            let endAngle = CGFloat(Double.pi * 2 * 0.5) // 50% for FastTableAPP
            
            let fastTablePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            let fastTableLayer = CAShapeLayer()
            fastTableLayer.path = fastTablePath.cgPath
            fastTableLayer.fillColor = UIColor.yellow.cgColor
            view.layer.addSublayer(fastTableLayer)
            
            let hostessPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: endAngle, endAngle: CGFloat(Double.pi * 2), clockwise: true)
            let hostessLayer = CAShapeLayer()
            hostessLayer.path = hostessPath.cgPath
            hostessLayer.fillColor = UIColor.green.cgColor
            view.layer.addSublayer(hostessLayer)
            
        }
        
    }
}




//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        view.addSubview(statsStackViews)
//        view.addSubview(titleLabel2)
//        view.addSubview(periodLabel2)
//        view.addSubview(lastUpdateLabel)
//        view.addSubview(avgTimeLabels)
//
//        view.addSubview(visitsLabels)
//        view.addSubview(reservesLabel)
//
//        setupGraphs()
//        drawLineChart()
//        constraint()
//
//    }
//        // Заголовок "Аналитика ресторана"
//     let titleLabel2: UILabel = {
//        let titleLabel = UILabel()
//        titleLabel.text = "Аналитика ресторана"
//        titleLabel.textAlignment = .center
//         titleLabel.textColor = .black
//        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        return titleLabel
//    }()
//        // Label для периода "1-15 февраля"
//    private let periodLabel2: UILabel = {
//        let periodLabel2 = UILabel()
//        periodLabel2.textColor = .black
//        periodLabel2.text = "1-15 фев."
//        periodLabel2.font = UIFont.systemFont(ofSize: 16)
//        periodLabel2.translatesAutoresizingMaskIntoConstraints = false
//        return periodLabel2
//    }()
//
//        // Label для последнего обновления
//    private let lastUpdateLabel: UILabel = {
//        let lastUpdateLabel = UILabel()
//        lastUpdateLabel.text = "Последнее обновление: сегодня в 16:00"
//        lastUpdateLabel.textColor = .black
//        lastUpdateLabel.font = UIFont.systemFont(ofSize: 12)
//        lastUpdateLabel.translatesAutoresizingMaskIntoConstraints = false
//        return lastUpdateLabel
//    }()
//
//        // Горизонтальная ячейка для посещений и резервов
//    private let visitsLabels: UILabel = {
//        let visitsLabels = UILabel()
//        visitsLabels.text = "13 посещений"
//        visitsLabels.textColor = .black
//        visitsLabels.font = UIFont.systemFont(ofSize: 16)
//        return visitsLabels
//    }()
//
//    private let reservesLabel: UILabel = {
//        let reservesLabel = UILabel()
//        reservesLabel.text = "23 резерва (23.2%)"
//        reservesLabel.textColor = .black
//        reservesLabel.font = UIFont.systemFont(ofSize: 16)
//        return reservesLabel
//    }()
//
//    let statsStackViews: UIStackView = {
//        let statsStackView = UIStackView()
//        //UIStackView(arrangedSubviews: [visitsLabels, reservesLabel])
//        statsStackView.axis = .horizontal
//        statsStackView.distribution = .fillEqually
//        statsStackView.translatesAutoresizingMaskIntoConstraints = false
//        return statsStackView
//    }()
//
//        // Label для среднего времени посещений
//    private let avgTimeLabels: UILabel = {
//        let avgTimeLabels = UILabel()
//        avgTimeLabels.text = "Среднее время посещений: 47 минут"
//        avgTimeLabels.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        avgTimeLabels.textAlignment = .center
//        avgTimeLabels.textColor = .black
//        avgTimeLabels.translatesAutoresizingMaskIntoConstraints = false
//        return avgTimeLabels
//    }()
//
//        // Добавляем графики ниже (например, посещений и резервов)
//
//        // Устанавливаем констрейнты для всех элементов
//
//
//      //  setupConstraints(titleLabel: titleLabel, periodLabel: periodLabel, lastUpdateLabel: lastUpdateLabel, statsStackView: statsStackView, avgTimeLabel: avgTimeLabel)
//
//
//    private func constraint() {
//        NSLayoutConstraint.activate([
//            titleLabel2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            titleLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            periodLabel2.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 10),
//            periodLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//
//            lastUpdateLabel.topAnchor.constraint(equalTo: periodLabel2.bottomAnchor, constant: 5),
//            lastUpdateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//
//            statsStackViews.topAnchor.constraint(equalTo: lastUpdateLabel.bottomAnchor, constant: 20),
//            statsStackViews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            statsStackViews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//
//            avgTimeLabels.topAnchor.constraint(equalTo: statsStackViews.bottomAnchor, constant: 20),
//            avgTimeLabels.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            avgTimeLabels.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }
//    //func setupConstraints(titleLabel: UILabel, periodLabel: UILabel, lastUpdateLabel: UILabel, statsStackView: UIStackView, avgTimeLabel: UILabel) {
//        // Констрейнты для всех элементов на экране
////        NSLayoutConstraint.activate([
////            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
////            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////
////            periodLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
////            periodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
////
////            lastUpdateLabel.topAnchor.constraint(equalTo: periodLabel.bottomAnchor, constant: 5),
////            lastUpdateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
////
////            statsStackView.topAnchor.constraint(equalTo: lastUpdateLabel.bottomAnchor, constant: 20),
////            statsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
////            statsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
////
////            avgTimeLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 20),
////            avgTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
////            avgTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
// //       ])
//  //  }
//
//    func setupGraphs() {
//        // Здесь будет логика для создания графиков с использованием UIBezierPath и CAShapeLayer
//        // Например, график посещений и резервов
//    }
//
//    func drawLineChart() {
//        let linePath = UIBezierPath()
//        linePath.move(to: CGPoint(x: 20, y: 100)) // Стартовая точка
//        linePath.addLine(to: CGPoint(x: 60, y: 50))
//        linePath.addLine(to: CGPoint(x: 100, y: 75)) // Добавляем точки и соединяем их
//
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = linePath.cgPath
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        shapeLayer.lineWidth = 2
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        view.layer.addSublayer(shapeLayer)
//    }
//
//
//}



//class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        setupUI()
//        setupConstraints()
//        setupGraphs()
//    }
//
//    // Метод для настройки интерфейса
//    func setupUI() {
//        // Добавьте все ваши элементы UI, такие как заголовки, графики и другие элементы.
//
//    }
//
//    // Метод для установки constraints
////    func setupConstraints() {
////        // Примените NSLayoutConstraint для всех элементов UI
////    }
//
//    // Метод для создания всех графиков
//    func setupGraphs() {
//        drawVisitsReservesAdsChart()
//        drawWeeklyVisitsChart()
//        drawHourlyVisitsChart()
//        drawPieChart()
//    }
//
//    // Логика для создания графиков будет здесь
//
//    func drawVisitsReservesAdsChart() {
//        let chartLayer = CAShapeLayer()
//        let chartPath = UIBezierPath()
//
//        // Примерные данные для графика (в зависимости от вашего API или данных)
//        let points = [CGPoint(x: 20, y: 100), CGPoint(x: 60, y: 150), CGPoint(x: 100, y: 120), CGPoint(x: 140, y: 200), CGPoint(x: 180, y: 170)]
//
//        chartPath.move(to: points[0])
//        for point in points.dropFirst() {
//            chartPath.addLine(to: point)
//        }
//
//        chartLayer.path = chartPath.cgPath
//        chartLayer.strokeColor = UIColor.red.cgColor
//        chartLayer.lineWidth = 2.0
//        chartLayer.fillColor = UIColor.clear.cgColor
//
//        view.layer.addSublayer(chartLayer)
//    }
//
//    func drawWeeklyVisitsChart() {
//        let weeklyLayer = CAShapeLayer()
//        let weeklyPath = UIBezierPath()
//
//        // Примерные данные для графика
//        let points = [CGPoint(x: 20, y: 100), CGPoint(x: 60, y: 50), CGPoint(x: 100, y: 75), CGPoint(x: 140, y: 150), CGPoint(x: 180, y: 120)]
//
//        weeklyPath.move(to: points[0])
//        for point in points.dropFirst() {
//            weeklyPath.addLine(to: point)
//        }
//
//        weeklyLayer.path = weeklyPath.cgPath
//        weeklyLayer.strokeColor = UIColor.green.cgColor
//        weeklyLayer.lineWidth = 2.0
//        weeklyLayer.fillColor = UIColor.clear.cgColor
//
//        view.layer.addSublayer(weeklyLayer)
//    }
//
//
//    func drawHourlyVisitsChart() {
//        let hourlyLayer = CAShapeLayer()
//        let hourlyPath = UIBezierPath()
//
//        // Примерные данные для графика
//        let points = [CGPoint(x: 20, y: 100), CGPoint(x: 60, y: 80), CGPoint(x: 100, y: 90), CGPoint(x: 140, y: 120), CGPoint(x: 180, y: 100)]
//
//        hourlyPath.move(to: points[0])
//        for point in points.dropFirst() {
//            hourlyPath.addLine(to: point)
//        }
//
//        hourlyLayer.path = hourlyPath.cgPath
//        hourlyLayer.strokeColor = UIColor.blue.cgColor
//        hourlyLayer.lineWidth = 2.0
//        hourlyLayer.fillColor = UIColor.clear.cgColor
//
//        view.layer.addSublayer(hourlyLayer)
//    }
//
//
//    func drawPieChart() {
//        let pieLayer = CAShapeLayer()
//        let piePath = UIBezierPath()
//
//        // Определим углы для секторов
//        let startAngle: CGFloat = 0
//        let endAngle: CGFloat = .pi * 2 * 0.5  // 50% для FastTableAPP
//
//        piePath.addArc(withCenter: CGPoint(x: 150, y: 150), radius: 50, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//        piePath.addLine(to: CGPoint(x: 150, y: 150))
//
//        pieLayer.path = piePath.cgPath
//        pieLayer.fillColor = UIColor.yellow.cgColor
//
//        // Добавляем круг для "Hostess" 50%
//        let secondPieLayer = CAShapeLayer()
//        let secondPiePath = UIBezierPath()
//
//        secondPiePath.addArc(withCenter: CGPoint(x: 150, y: 150), radius: 50, startAngle: endAngle, endAngle: .pi * 2, clockwise: true)
//        secondPiePath.addLine(to: CGPoint(x: 150, y: 150))
//
//        secondPieLayer.path = secondPiePath.cgPath
//        secondPieLayer.fillColor = UIColor.green.cgColor
//
//        view.layer.addSublayer(pieLayer)
//        view.layer.addSublayer(secondPieLayer)
//    }
//
//    func setupConstraints() {
//        // Пример констрейнтов для лейбла даты
//        NSLayoutConstraint.activate([
//           periodLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            periodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            periodLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
//        ])
//
//        // Добавьте констрейнты для всех других компонентов
//    }
//
//
//
//}
//
