//
//  ExerciseView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/11.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State private var rating = 0
    @State private var showSuccess = false
    let index: Int
    let interval: CFTimeInterval = 30
    var body: some View {
        // Option-Command-[or]: 上下移动行
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab,titleText: Exercise.exercises[index].exerciseName)
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
                HStack(spacing: 150) {
                    Button("Start Exercise") {}
                    Button("Done") {
                        if lastExercise {
                            showSuccess.toggle()
                        } else {
                            selectedTab += 1
                        }
                    }.sheet(isPresented: $showSuccess) {
                        SuccessView(selectedTab: $selectedTab)
                    }
                }.font(.title3).padding()
                RatingView(rating: $rating)
                    .padding()
                Spacer()
                Button("History") {}
                    .padding(.bottom)
            }
        }
    }
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1), index: 3) // 参数1要求传递一个Binding，但是对于这个preview来说是困难的，一般Binding都来自于上一级view，所以SwiftUI提供了Binding type方法constant(_:)来创建一个临时需要的Binding
    }
}


