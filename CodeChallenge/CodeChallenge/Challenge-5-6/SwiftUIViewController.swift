//
//  SwiftUIViewController.swift
//  CodeChallenge
//
//  Created by Pushan  on 2022-06-19.
//  Copyright © 2022 io.freshwork. All rights reserved.
//

import UIKit
import SwiftUI

class SwiftUIViewController: UIViewController {
    
    let hostingViewTag = 8997

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.view.viewWithTag(hostingViewTag) == nil {
            showSwiftUIView()
        }
    }
    
    func showSwiftUIView() {
        
        let logoView: ContentView = ContentView()
        let hosting = UIHostingController(rootView: logoView)
        hosting.view.tag = hostingViewTag
        self.view.addSubview(hosting.view)
        let xConstraint = NSLayoutConstraint(item: hosting.view!, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0);
        let yConstraint = NSLayoutConstraint(item: hosting.view!, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: hosting.view!, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: hosting.view!, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0)
        
        hosting.view.addConstraint(widthConstraint)
        hosting.view.addConstraint(heightConstraint)
        self.view.addConstraint(xConstraint)
        self.view.addConstraint(yConstraint)
        self.addChild(hosting);
        
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
