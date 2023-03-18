//
//  WelcomeView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/11.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @State private var showHistory = false
    var getStartedButton: some View {
        RaisedButton(buttonText: "Get Started") {
            selectedTab = 0
        }.padding()
    }
    var historyButton: some View {
        Button(action: { showHistory = true }) {
            Text("History").fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        }.padding(.bottom, 10)
            .buttonStyle(EmbossedButtonStyle())
    }
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab,titleText: "Welcome")
                Spacer()
                ContainerView {
                    VStack {
                        WelcomeView.images
                        WelcomeView.welcomeText
                        getStartedButton
                        Spacer()
                        historyButton
                    }
                }.frame(height: geometry.size.height * 0.8)
            }.sheet(isPresented: $showHistory) {
                HistoryView(showHistory: $showHistory)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}
