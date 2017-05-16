//
//  ImageAreaView.swift
//  MyDigitalMeal
//
//  Created by Gary Shirk on 5/16/17.
//  Copyright © 2017 Gary Shirk. All rights reserved.
//

import UIKit

class GGSSelectionAreaView: UIView {

    var lastPoint: CGPoint = CGPoint.zero
    var points = [CGPoint]()
    var curves = [[CGPoint]]()
    var plusPath: UIBezierPath!
    
    var isSelectionFinished = false
    
    var callback: ((_ points: [CGPoint]) -> Void)?
    
    override func draw(_ rect: CGRect) {
        
        let path = drawPath(points)
        
        path.stroke()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        points = [CGPoint]()
        
        if let touch = touches.first {
            lastPoint = touch.location(in: self)
            points.append(lastPoint)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let newPoint = touch.location(in: self)
            points.append(newPoint)
            
            lastPoint = newPoint
            setNeedsDisplay()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        let alert = UIAlertView.init(title: "Is it ok?", message: "", delegate: self, cancelButtonTitle: "Again", otherButtonTitles: "Ok")
//        alert.show()
    }
    
    func drawPath(_ curve: [CGPoint]) -> UIBezierPath {
        
        let path = UIBezierPath()
        
        UIColor.green.setStroke()
        UIColor.red.setFill()
        
        path.lineWidth = 10.0
        
        if curve.count > 0 {
            path.move(to: curve.first!)
            for point in curve {
                path.addLine(to: point)
            }
        }
        
        return path
    }
    
//    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
//        
//        if alertView.cancelButtonIndex != buttonIndex {
//            
//            callback?(points)
//            
//        }
//        points = [CGPoint]()
//        setNeedsDisplay()
//    }

}
