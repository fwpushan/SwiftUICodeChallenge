//
//  ViewController.swift
//  CodeChallenge
//
//  Created by Pushan  on 2022-06-17.
//  Copyright © 2022 io.freshwork. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var apiCaller = APICaller()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /**
      * UI Actions
     */
    @IBAction func apiAction(_ sender: Any) {
        self.apiCaller.getIP { result in
            switch result {
            case .success(let ip):
                print("Closure IP: \(ip)")
            case .failure(let errr):
                print("Closure API error: \(errr)")
            }
        }
    }
    
    @IBAction func apiActionWithAsync(_ sender: Any) {
        do {
            Task.init {
                do {
                    let result = try await self.apiCaller.getIp();
                    switch result {
                    case .success(let ip):
                        print("Async IP: \(ip)")
                    case .failure(let errr):
                        print("Async error: \(errr)")
                    }
                } catch let error {
                    print("Api call fail with error \(error)")
                }
            }
        }
    }
    
    // Code Challenge 2: Presenting color selector View
    @IBAction func showUIKitColorSelector(_ sender: Any) {
        self.performSegue(withIdentifier: "presentColorSelector", sender: self)
    }
    
    @IBAction func showSwiftUIColorSelectView(_ sender: Any) {
        let swiftColorSelector = ColorSelectSwiftUIView()
        self.navigationController?.pushViewController(UIHostingController(rootView: swiftColorSelector), animated: true)
    }
    
    
    // Code Challenge 5/6
    // Showing SwiftUI view 
    @IBAction func showSwiftUILogoViewController(_ sender: Any) {
        let logoView: ContentView = ContentView()
        self.navigationController?.pushViewController(UIHostingController(rootView: logoView), animated: true)
    }
    
    // Code Challenge 6
    @IBAction func showLogoViewProgrammatically(_ sender: Any) {
        self.performSegue(withIdentifier: "showLogoView", sender: self)
    }
    
    
    // End Code Challenge 6
    
    
}

