//
//  HIITFitApp.swift
//  HIITFit
//
//  Created by rnake on 2023/3/10.
//

import SwiftUI

@main // 表明了遵从App协议的自定义struct提供了程序的进入点，App协议提供了启动应用程序的main方法的默认实现
struct HIITFitApp: App {
    // App必须实现computed property:body并且返回一个Scene， Scene是视图层次的根视图的容器
    @StateObject private var historyStore: HistoryStore // 使用'@StateObject'创建一个可观察的对象，这个对象是只读的，只能被赋值一次
    @State private var showAlert = false
    var body: some Scene {
        // 在iOS中一种常见的做法是根据用户是否登陆来决定根视图
        // 在iOS中视图层次填充整个屏幕，macOS和iPadOS中WindowGroup可以管理多个视图
        WindowGroup {
            ContentView()
                .environmentObject(historyStore)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("History"), message: Text("""
                    Unfortunately we can't load your past history.
                    Email support:
                        support@xyz.com
                """))
                }
        }
    }
    init() {
        let historyStore: HistoryStore
        do {
            historyStore = try HistoryStore(withChecking: true)
        } catch {
            showAlert = true
            print("Could not load history data")
            historyStore = HistoryStore()
        }
        _historyStore = StateObject(wrappedValue: historyStore)
    }
}
