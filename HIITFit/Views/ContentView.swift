//
//  ContentView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/10.
//

import SwiftUI

// 界面控制:
//  Command-0: Hide/show Navigator、Command-1 to Command-9:在9个tab中转换
//  Option-Command-0: Hide/show Inspectors、Option-Command-1 to Option-Command-4: 在4个检视器中转换
//  Shift-Command-Y: Hide/show Debug Area
//  Option-Command-Return: shows or hides the preview canvas

// Command-,: 打开设置
// Command-.: 停止正在运行的项目
// Option-click library button：保持library打开
struct ContentView: View {
    var body: some View {
        TabView { // Option-Command-hover '{[(' or double click
            WelcomeView()
            ForEach(0 ..< 4) { number in
                //  Control-Option-click: open the Attributes inspector pop-up window
                ExerciseView(index: number)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .padding()
    }
}

//  Option-Command-P: refresh the preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        通过这种方式指定device，且可以多个预览存在于Canvas
//        ContentView()
//            .previewDevice("iPhone 12")
    }
}
