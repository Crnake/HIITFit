//
//  ContentView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/10.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 9
    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab).tag(9)
            ForEach(0 ..< Exercise.exercises.count) { number in
                ExerciseView(selectedTab: $selectedTab, index: number).tag(number)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
