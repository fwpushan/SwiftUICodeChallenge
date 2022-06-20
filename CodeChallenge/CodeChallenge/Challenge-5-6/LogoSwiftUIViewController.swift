//
//  LogoSwiftUIViewController.swift
//  CodeChallenge
//
//  Created by Pushan  on 2022-06-20.
//  Copyright © 2022 io.freshwork. All rights reserved.
//

// Code Challenge 6
import UIKit
import SwiftUI

class LogoSwiftUIViewController: UIHostingController<ContentView> {
    
    
    public init() {
        super.init(rootView: ContentView())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(rootView: ContentView())
    }
}
