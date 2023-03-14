//
//  ExerciseView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/11.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    let index: Int
    let interval: TimeInterval = 30
    var body: some View {
        // Option-Command-[or]: 上下移动行
        GeometryReader { geometry in
            VStack {
                HeaderView(titleText: Exercise.exercises[index].exerciseName)
                    .padding(.bottom)
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: ".mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.3)
                } else {
                    Text("Couldn't find \(Exercise.exercises[index].videoName).mp4")
                        .foregroundColor(.red)
                }
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: 90))
                Button("Start/Done button") {}
                    .font(.title3)
                    .padding()
                RatingView()
                    .padding()
                Spacer()
                Button("History") {}
                    .padding(.bottom)
            }
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(index: 0)
    }
}


