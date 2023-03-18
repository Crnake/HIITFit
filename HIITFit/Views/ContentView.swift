//
//  ContentView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/10.
//

import SwiftUI

struct ContentView: View {
    // 类似于AppStorage，那为什么不直接用AppStorage？？？？？
    // SceneStorage在存储时会重新初始化与之相关的views，如果将下面的HistoryStore在这个页面初始化的话，每次selectedTab的改变都会造成重新初始化HistoryStore
    @SceneStorage("selectedTab") private var selectedTab = 9
    var body: some View {
        ZStack {
            GradientBackground()
            TabView(selection: $selectedTab) {
                WelcomeView(selectedTab: $selectedTab).tag(9)
                ForEach(0 ..< Exercise.exercises.count) { number in
                    ExerciseView(selectedTab: $selectedTab, index: number).tag(number)
                }
            }
            //将HistoryStore这个class的实例作为EnvironmentObject传递，这样YabView的subviews都可以通过environment访问这个class中的数据
    //        .environmentObject(HistoryStore())
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onAppear {
                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
