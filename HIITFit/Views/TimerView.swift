//
//  TimerView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/14.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 30
    @Binding var timerDone: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        CircularSliderView(timeRemaining: $timeRemaining)
            .onReceive(timer) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    timerDone = true
                }
            }
//        Text("\(timeRemaining)")
//            .font(.system(size: 90, design: .rounded))
//            .padding()
//            .onReceive(timer) { _ in
//                if self.timeRemaining > 0 {
//                    self.timeRemaining -= 1
//                } else {
//                    timerDone = true
//                }
//            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerDone: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
