//
//  LogoSwiftView.swift
//  CodeChallenge
//
//  Created by Pushan  on 2022-06-19.
//  Copyright © 2022 io.freshwork. All rights reserved.
//

import Foundation

import SwiftUI

// Code Challenge 5: Creating image view in SwiftUI
struct ContentView: View {
    var body: some View {
        Image("ey")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 120, height: 120, alignment: .center)
            .border(Color.blue, width: 3.0)
            .clipped()
    }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
