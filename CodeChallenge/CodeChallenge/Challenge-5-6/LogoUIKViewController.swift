//
//  LogoUIKViewController.swift
//  CodeChallenge
//
//  Created by Pushan  on 2022-06-19.
//  Copyright © 2022 io.freshwork. All rights reserved.
//

import UIKit

// Code Challenge 5: Creating ImageView Programmatically using UIKit
class LogoUIKViewController: UIViewController {
    
    let imageViewTag = 9001
    
    func createImageView() {
        let image: UIImage = #imageLiteral(resourceName: "ey")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 2, height: 120)
        imageView.contentMode = .scaleAspectFit
        imageView.tag = imageViewTag
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        let xConstraint = NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0);
        let yConstraint = NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120)
        let heightConstraint = NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120)
        self.view.addConstraint(xConstraint)
        self.view.addConstraint(yConstraint)
        imageView.addConstraint(widthConstraint)
        imageView.addConstraint(heightConstraint)
        self.view?.layoutSubviews()
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding image view if not already added
        if self.view.viewWithTag(imageViewTag) == nil {
            self.createImageView()
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
