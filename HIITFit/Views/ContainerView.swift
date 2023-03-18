//
//  ContainerView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/17.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    var content: Content
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0).foregroundColor(Color("background"))
            VStack {
                Spacer()
                Rectangle().frame(height: 25).foregroundColor(Color("background"))
            }
            content
        }
    }
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView {
            VStack {
                RaisedButton(buttonText: "Hello World") { }.padding(50)
                Button("Tap me") {}.buttonStyle(EmbossedButtonStyle(buttonShape: .round))
            }
        }.padding(50)
            .previewLayout(.sizeThatFits)
    }
}
