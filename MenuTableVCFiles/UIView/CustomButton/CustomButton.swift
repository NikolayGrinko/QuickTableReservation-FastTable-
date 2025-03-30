//
//  CustomButton.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 28.09.2024.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        bounds.insetBy(dx: -50, dy: -50).contains(point)
    }
    
}
