//
//  ContentView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()
            ForEach(0 ..< Exercise.exercises.count) { number in
                ExerciseView(index: number)
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
