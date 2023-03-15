//
//  CircularSliderView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/15.
//

import SwiftUI

struct CircularSliderView: View {
    @Binding var timeRemaining: Int
    private var progress: Double {
        (30.0 - Double(timeRemaining)) / 30.0
    }
    let ringDiameter = 300.0
    private var rotationAngle: Angle {
        Angle(degrees: 360.0 * progress)
    }
    var body: some View {
        ZStack {
            Circle().stroke(Color(hue: 0.0, saturation: 0.0, brightness: 0.9), lineWidth: 20.0)
            Circle().trim(from: 0, to: progress)
                .stroke(Color(hue: 0.0, saturation: 0.5, brightness: 0.9), style: StrokeStyle(lineWidth: 20.0, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
            Circle().fill(Color.white).frame(width: 21, height: 21)
                .offset(y: -ringDiameter / 2.0)
                .rotationEffect(rotationAngle)
            Text("\(timeRemaining)").font(.system(size: 90))
        }.frame(width: ringDiameter, height: ringDiameter)
    }
}

struct CircularSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CircularSliderView(timeRemaining: .constant(30))
    }
}
