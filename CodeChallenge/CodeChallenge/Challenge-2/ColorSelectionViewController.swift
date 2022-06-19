//
//  ColorSelectionViewController.swift
//  CodeChallenge
//
//  Created by Pushan  on 2022-06-19.
//  Copyright © 2022 io.freshwork. All rights reserved.
//

import UIKit

enum SelectedColor: Int {
    case red = 0, green, blue, brown, yellow, gray
}

class ColorSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func colorSelectionAction(_ sender: Any) {
        guard let segmentedControl = sender as? UISegmentedControl else {
            return
        }
        
        var selectedUIColor: UIColor
        
        let selectedColor: SelectedColor = SelectedColor(rawValue: segmentedControl.selectedSegmentIndex) ?? .gray
        switch selectedColor {
        case .red:
            selectedUIColor = .red
        case .green:
            selectedUIColor = .green
        case .blue:
            selectedUIColor = .blue
        case .brown:
            selectedUIColor = .brown
        case .yellow:
            selectedUIColor = .yellow
        case .gray:
            selectedUIColor = .gray
        }
        
        DispatchQueue.main.async {
            segmentedControl.selectedSegmentTintColor = selectedUIColor
        }
        
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
