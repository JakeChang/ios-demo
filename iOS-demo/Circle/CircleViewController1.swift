//
//  CircleViewController1.swift
//  iOS-demo
//
//  Created by Jake Chang on 2023/3/28.
//

import UIKit

class CircleViewController1: UIViewController {
    
    @IBOutlet weak var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = CGPoint(x: circleView.bounds.midX, y: circleView.bounds.midY)
        let radius = 100.0
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: CGFloat(0),
                                endAngle: CGFloat(Double.pi * 2),
                                clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.gray.cgColor
        shapeLayer.lineWidth = 24.0
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        circleView.layer.addSublayer(shapeLayer)
        
        let percent = 0.89
        let startAngle = CGFloat(Double.pi * 1.5)
        let endAngle = CGFloat(startAngle + percent * 2 * Double.pi)
        let path2 = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.strokeColor = UIColor.red.cgColor
        shapeLayer2.lineWidth = 24.0
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.clear.cgColor
        shapeLayer2.lineCap = .round
        circleView.layer.addSublayer(shapeLayer2)
    }
}
