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
    
    // Instance variables
    var apiCaller = APICaller()
    
    // IBOutlets
    @IBOutlet weak var ipLabel: UILabel?
    @IBOutlet weak var ipClosureActionButton: UIButton?
    @IBOutlet weak var ipClosureActionActivity: UIActivityIndicatorView?
    @IBOutlet weak var asyncClosureActionButton: UIButton?
    @IBOutlet weak var asyncClosureActionActivity: UIActivityIndicatorView?
    
    // Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /**
      * UI Actions
     */
    @IBAction func apiAction(_ sender: Any) {
        self.ipClosureActionButton?.alpha = 0.3;
        self.ipClosureActionActivity?.isHidden = false;
        self.apiCaller.getIP { result in
            DispatchQueue.main.async {
                self.ipClosureActionButton?.alpha = 1.0;
                self.ipClosureActionActivity?.isHidden = true;
            }
            switch result {
            case .success(let ip):
                print("Closure IP: \(ip)")
                DispatchQueue.main.async {
                    self.ipLabel?.text = "IP Address (closure): \(ip)"
                }
            case .failure(let err):
                print("Closure API error: \(err)")
                DispatchQueue.main.async {
                    self.ipLabel?.text = "IP detection fail with error  (closure): \(err)"
                }
            }
        }
    }
    
    @IBAction func apiActionWithAsync(_ sender: Any) {
        self.asyncClosureActionButton?.alpha = 0.3
        self.asyncClosureActionActivity?.isHidden = false;
        do {
            Task.init {
                do {
                    let result = try await self.apiCaller.getIp();
                    DispatchQueue.main.async {
                        self.asyncClosureActionButton?.alpha = 1.0
                        self.asyncClosureActionActivity?.isHidden = true;
                    }
                    switch result {
                    case .success(let ip):
                        print("Async IP: \(ip)")
                        DispatchQueue.main.async {
                            self.ipLabel?.text = "IP Address (async): \(ip)"
                        }
                    case .failure(let err):
                        print("Async error: \(err)")
                        DispatchQueue.main.async {
                            self.ipLabel?.text = "IP detection fail with error (async): \(err)"
                        }
                    }
                } catch let error {
                    print("Api call fail with error \(error)")
                    DispatchQueue.main.async {
                        self.ipLabel?.text = "IP detection fail with error (async): \(error)"
                    }
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
    // UIKit
    @IBAction func showLogoViewProgrammatically(_ sender: Any) {
        self.performSegue(withIdentifier: "showLogoView", sender: self)
    }
    
    // SwiftUI
    @IBAction func showLogoSwiftVC(_ sender: Any) {
        self.performSegue(withIdentifier: "showSwiftUILogoVC", sender: self)
    }
    
    @IBAction func showLogoSwiftVCInModal(_ sender: Any) {
        self.present(UIHostingController(rootView: LogoSwiftViewModal(container: self)), animated: true)
    }
    
    // End Code Challenge 6
    
    
}

