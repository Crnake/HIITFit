//
//  WelcomeView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/11.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                HeaderView(titleText: "Welcome")
                Spacer()
                Button("History") {}
                    .padding(.bottom)
            }
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image("step-up")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 200.0, height: 200) // 以上三个modifier一般都是连用的
                        .resizedToFill(width: 200, height: 200) // 自定义modifier，结合了上面的三个modifier
                        .clipShape(Circle())
                }
                Button(action: {}) {
                    Text("Get Started")
                    Image(systemName: "arrow.right.circle")
//                    Label("Get Started", systemImage: "arrow.right.circle") // 固定了图片在前，文本在后
                }.font(.title2)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 2))
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
