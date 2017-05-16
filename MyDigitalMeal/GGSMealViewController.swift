//
//  GGSMealViewController.swift
//  MyDigitalMeal
//
//  Created by Gary Shirk on 5/14/17.
//  Copyright © 2017 Gary Shirk. All rights reserved.
//

import UIKit

class GGSMealViewController: UIViewController {
    
    @IBOutlet weak var selectionView: GGSSelectionAreaView!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mealImgView: UIImageView!
    
    var greeting: String!
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = color
        //self.label.text = greeting
        
        selectionView.callback = { (points) in
            
            let path = UIBezierPath()
            
            for point in points {
                
                if points.first == point {
                    
                    path.move(to: point)
                    
                } else {
                    
                    path.addLine(to: point)
                    
                }
            }
            
            path.close()
            
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            
            self.imageView.layer.mask = layer
            
            UIGraphicsBeginImageContext(self.imageView.bounds.size)
            
            self.imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            let croppedCGImage =  image?.cgImage!.cropping(to: path.cgPath.boundingBoxOfPath);
            
            let croppedImage = UIImage(cgImage: croppedCGImage!)
            
            self.imageView.image = croppedImage
            
            self.imageView.layer.mask = nil
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
