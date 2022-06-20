//
//  LogoSwiftViewModal.swift
//  CodeChallenge
//
//  Created by Pushan  on 2022-06-20.
//  Copyright © 2022 io.freshwork. All rights reserved.
//

import SwiftUI

struct LogoSwiftViewModal: View {
    var container: UIViewController? = nil;
    var body: some View {
        VStack {
            Button {
                print("Action")
                self.container?.dismiss(animated: true)
            } label: {
                Text("Dismiss")
            }

            Image("ey")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120, alignment: .center)
                .border(Color.blue, width: 3.0)
                .clipped()
        }
    }
}

struct LogoSwiftViewModal_Previews: PreviewProvider {
    static var previews: some View {
        LogoSwiftViewModal()
    }
}
