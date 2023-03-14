//
//  HeaderView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/11.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    let titleText: String
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
                ForEach(0 ..< Exercise.exercises.count) { index in
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(fill)")
                        .onTapGesture {
                            selectedTab = index
                        }
                }
            }.font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        // 这里的Group为什么没有将两个View合并到同一个View中去？？？
        Group {
            HeaderView(selectedTab: .constant(0), titleText: "Squat")
                .previewLayout(.sizeThatFits)
            HeaderView(selectedTab: .constant(1), titleText: "Squat")
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(.sizeThatFits)
        }
    }
}
