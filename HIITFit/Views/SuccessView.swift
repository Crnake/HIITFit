//
//  SuccessView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/11.
//

import SwiftUI

struct SuccessView: View {
    @Binding var selectedTab: Int
    @Environment(\.presentationMode) var presentationMode // 特定于view的，它与拥有isPresented属性和dismiss()方法的struct相绑定。当位于这个view时，presentationMode的值为true，但是presentationMode这个Enviroment property只是可读的，你不能直接修改它的值
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                VStack {
                    Text("Good job completing all four exercises!")
                    Text("Remember tomorrow's another day.")
                    Text("So eat well and get some rest.")
                }.foregroundColor(.gray)
                Spacer()
            }
            Button("Continue") {
                presentationMode.wrappedValue.dismiss()
                selectedTab = 9
            }.padding()
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 2))
//            Button(action: {}) {
//                Text("Continue")
//                    .padding()
//                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 2))
//            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectedTab: .constant(3))
    }
}
