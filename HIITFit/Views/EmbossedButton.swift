//
//  EmbossedButton.swift
//  HIITFit
//
//  Created by rnake on 2023/3/17.
//

import SwiftUI

enum EmbossedButtonShape {
    case round
    case capsule
}

struct EmbossedButtonStyle: ButtonStyle {
    var buttonShape = EmbossedButtonShape.capsule
    
    func makeBody(configuration: Configuration) -> some View {
        let shadow = Color("drop-shadow")
        let highlight = Color("drop-highlight")
        return configuration.label.padding(10).background(
            GeometryReader { geometry in
                shape(size: geometry.size)
                    .foregroundColor(Color("background"))
                    .shadow(color: shadow, radius: 1, x: 2, y: 2)
                    .shadow(color: highlight, radius: 1, x: -2, y: -2)
                    .offset(x: -1, y: -1)
            }
        )
    }
    
    // 这里some View必须是一个确定的类型，在switch下是在运行时才决定是那个类型的view，所以在编译阶段编译器不能确定具体的some View类型
    // 解决方案：
    // 1、将switch放入Group中
    // 2、'@ViewBuilder'，HStack、VStack可以显示各种各样的Views都是使用了'@ViewBuilder';在内部，'@ViewBuilder'将至多10个View组合成一个TupleView，tuple可以包含各种类型
    @ViewBuilder
    func shape(size: CGSize) -> some View {
        switch buttonShape {
        case .round:
            Circle().stroke(Color("background"), lineWidth: 2)
                .frame(width: max(size.width, size.height), height: max(size.width, size.height))
                .offset(x: -1)
                .offset(y: -max(size.width, size.height) / 2 + min(size.height, size.width) / 2)
        case .capsule:
            Capsule().stroke(Color("background"), lineWidth: 2)
        }
    }
}

struct EmbossedButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {}) {
            Text("History").fontWeight(.bold)
        }.buttonStyle(EmbossedButtonStyle(buttonShape: .round))
            .padding(40)
            .previewLayout(.sizeThatFits)
    }
}
