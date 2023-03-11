//
//  SuccessView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/11.
//

import SwiftUI

struct SuccessView: View {
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
            Button(action: {}) {
                Text("Continue")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 2))
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
