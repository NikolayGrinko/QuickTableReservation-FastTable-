//
//  ActionButton.swift
//  QuickTableReservation(FastTable)
//
//  Created by Николай Гринько on 11.10.2024.
//

import UIKit

class ActionButton: UIButton {
    
    private var panGestureR:UIPanGestureRecognizer?
    
    private var swipableView:UILabel?
    private var swipeOverlay:UIImageView?

    private(set) var swipe_direction:SwipeDirection = .none
    
    enum SwipeDirection {
        case right
        case left
        case none
    }
    @IBInspectable var ImageOverlay: UIImage?  {
        didSet {
            self.ImageOverlay = ImageOverlay!
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        if self.swipableView == nil {
            self.addSubview(self.setSwipableLayer())
        }
            self.clipsToBounds = true
            super.draw(rect)
    }
    
    // To Add the swipable lable with pan-gesture enabled over the button
    func setSwipableLayer() -> UIView {
        self.layer.cornerRadius = 10
        
        swipableView = UILabel.init(frame: CGRect(x: 2 , y: 2, width: self.frame.size.height - 4, height: (self.frame.size.height - 4)))
        swipableView?.isUserInteractionEnabled = true
        swipableView?.textAlignment = .left
        swipableView?.tag = 1020
        swipableView?.textColor = self.titleColor(for: UIControl.State.normal)
        swipableView?.backgroundColor = UIColor.white
        swipableView?.layer.cornerRadius = 10
        swipableView?.font = UIFont.boldSystemFont(ofSize: 16.0)
        swipableView?.clipsToBounds = true
        
            swipeOverlay = UIImageView.init(image: ImageOverlay)
            swipeOverlay!.frame = CGRect(x: 2 , y: 2, width: ((swipableView?.frame.width)!) - 4, height: ((swipableView?.frame.width)!) - 4)
            swipeOverlay?.image = UIImage(named: "WhiteRightArrow")
            swipeOverlay!.isUserInteractionEnabled = true
            swipeOverlay!.backgroundColor = UIColor.white
            swipeOverlay!.contentMode = UIView.ContentMode.scaleAspectFill
            swipeOverlay?.clipsToBounds = true
            swipableView?.insertSubview(swipeOverlay!, at: 1)
        
        panGestureR = UIPanGestureRecognizer.init(target: self, action: #selector(handelPanGesture(panGesture:)))
        swipableView!.addGestureRecognizer(panGestureR!)
        
        return swipableView!
    }
    
    @objc func handelPanGesture(panGesture: UIPanGestureRecognizer) {
        
        let translation = panGesture.translation(in: panGesture.view?.superview)
        let xPos:Int = Int(translation.x)
        let threshHoldX:Int = Int(self.frame.size.width - self.frame.size.height)
        if xPos >= 0 {
            if self.swipe_direction == .none {
                self.swipe_direction = self.getSwipeDirection(translation: translation)
            }
            
            if self.swipe_direction == .right {
                if Int((self.swipableView?.frame.origin.x)!) > threshHoldX {
                    //Ignore if the state is final.
                    return
                }
                
                if panGesture.state == UIGestureRecognizer.State.ended {
                    if  xPos > threshHoldX {
                        UIView.animate(withDuration: 0.2, animations: {
                            self.swipableView!.frame = CGRect(x:((self.frame.size.width)-(self.swipableView?.frame.size.width)! - 2), y: (self.swipableView?.frame.origin.y)!, width: (self.swipableView?.frame.size.width)!, height: (self.frame.size.height - 4))
                        })

                        self.sendActions(for: .valueChanged)
                    }else {
                        UIView.animate(withDuration: 0.2, animations: {
                            self.swipableView!.frame = CGRect(x:2, y: (self.swipableView?.frame.origin.y)!, width: (self.swipableView?.frame.size.width)!, height: (self.frame.size.height - 4))
                        })
                    }
                }else{
                    if xPos > threshHoldX {
                        return
                    }
                    //To set the x position of the swipe lable layer to the gesture translation value.
                    UIView.animate(withDuration: 0.0) {
                        self.swipableView!.frame = CGRect(x: (translation.x) , y: (self.swipableView?.frame.origin.y)!, width: (self.swipableView?.frame.size.width)!, height: (self.frame.size.height - 4))
                    }
                    
                }
            }
        }
    }
    
    func getSwipeDirection(translation:CGPoint) -> SwipeDirection {
        
        if translation.x > 0 {
            return .right
        }else if translation.x < 0 {
            return .left
        }else{
            return .none
        }
        
    }
    
    override func sendActions(for controlEvents: UIControl.Event) {
        super.sendActions(for: controlEvents)
    }

}

