//
//  ColorSelectSwiftUIView.swift
//  CodeChallenge
//
//  Created by Pushan  on 2022-06-19.
//  Copyright © 2022 io.freshwork. All rights reserved.
//

import SwiftUI

enum Colors: String, CaseIterable{
    case red, yellow, green, blue, gray, brown

    func displayColor() -> String {
        self.rawValue.capitalized
    }
}

struct ColorSelectSwiftUIView: View {
    @State private var selectedColor = Colors.red

        var body: some View {
            Picker(selection: $selectedColor, label: Text("Colors")) {
                ForEach(Colors.allCases, id: \.self) { color in
                    Text(color.displayColor())
                }
            }
            .padding()
            .colorMultiply(color(selectedColor))
            .pickerStyle(SegmentedPickerStyle())
        }

        func color(_ selected: Colors) -> Color {
            switch selected {
            case .red:
                return .red
            case .yellow:
                return .yellow
            case .green:
                return .green
            case .blue:
                return .blue
            case .brown:
                return .brown
            case .gray:
                return .gray
            }
        }
}

struct ColorSelectSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectSwiftUIView()
    }
}
