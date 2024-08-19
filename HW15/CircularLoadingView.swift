//
//  CircularLoadingView.swift
//  HW15
//
//  Created by Максим Громов on 06.08.2024.
//

import UIKit

class CircularLoadingView: UIView {
    private var circleLayer = CAShapeLayer()
    //private var secondLayer = CAShapeLayer()
    private var backgroundLayer = CAShapeLayer()
    private var animationDuration: TimeInterval = 1.5
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCircularLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCircularLayer()
    }
    
    private func setupCircularLayer() {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - 20
        
        let backgroundPath = UIBezierPath(roundedRect: .init(origin: .zero, size: frame.size), cornerRadius: 20)
        backgroundLayer.path = backgroundPath.cgPath
        backgroundLayer.fillColor = UIColor.systemGray3.cgColor
        backgroundLayer.shadowOffset = .init(width: 3, height: 3)
        backgroundLayer.shadowRadius = 4
        backgroundLayer.shadowOpacity = 0.7
        layer.addSublayer(backgroundLayer)
        
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -1 * .pi / 2, endAngle: 1.5 * .pi, clockwise: true)
        circleLayer.path = circularPath.cgPath
        circleLayer.strokeColor = UIColor.blue.cgColor
        circleLayer.lineWidth = 5.0
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        layer.addSublayer(circleLayer)
    }
    func startAnimating() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 2
        animation.duration = animationDuration
        animation.repeatCount = .infinity
        circleLayer.add(animation, forKey: "end")
        
        let secondAnimation = CABasicAnimation(keyPath: "strokeStart")
        secondAnimation.fromValue = -1
        secondAnimation.toValue = 1
        secondAnimation.duration = animationDuration
        secondAnimation.repeatCount = .infinity
        circleLayer.add(secondAnimation, forKey: "start")
        
    }
    func stopAnimating(){
        circleLayer.removeAnimation(forKey: "start")
        circleLayer.removeAnimation(forKey: "end")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
