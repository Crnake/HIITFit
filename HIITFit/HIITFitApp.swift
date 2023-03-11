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
    var body: some Scene {
        // 在iOS中一种常见的做法是根据用户是否登陆来决定根视图
        // 在iOS中视图层次填充整个屏幕，macOS和iPadOS中WindowGroup可以管理多个视图
        WindowGroup {
            ContentView()
        }
    }
}
