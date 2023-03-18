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
    @State private var showSuccess = false
    @State private var showHistory = false
    let index: Int
    @State private var timeDone = false
    @State private var showTimer = false
    @EnvironmentObject var history: HistoryStore
    var startExerciseButton: some View {
        RaisedButton(buttonText: "Start Exercise") {
            showTimer.toggle()
        }
    }
    var historyButton: some View {
        Button(action: { showHistory = true }) {
            Text("History").fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        }.padding(.bottom, 10)
            .buttonStyle(EmbossedButtonStyle())
    }
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
                HStack(spacing: 150) {
//                    Button("Start Exercise") {
//                        showTimer.toggle()
//                    }
                    startExerciseButton
                    Button("Done") {
                        history.addDoneExercise(Exercise.exercises[index].exerciseName)
                        timeDone = false
                        showTimer.toggle()
                        if lastExercise {
                            showSuccess.toggle()
                        } else {
                            selectedTab += 1
                        }
                    }.disabled(!timeDone)
                    .sheet(isPresented: $showSuccess) {
                        SuccessView(selectedTab: $selectedTab)
                    }
                }.font(.title3).padding()
                if showTimer {
                    TimerView(timerDone: $timeDone)
                }
                Spacer()
                RatingView(exerciseIndex: index)
                    .padding()
                historyButton
                    .sheet(isPresented: $showHistory) {
                        HistoryView(showHistory: $showHistory)
                    }.padding(.bottom)
            }
        }
    }
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(3), index: 3) // 参数1要求传递一个Binding，但是对于这个preview来说是困难的，一般Binding都来自于上一级view，所以SwiftUI提供了Binding type方法constant(_:)来创建一个临时需要的Binding
            .environmentObject(HistoryStore())
    }
}


