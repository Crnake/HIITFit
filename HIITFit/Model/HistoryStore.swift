//
//  HistoryStore.swift
//  HIITFit
//
//  Created by rnake on 2023/3/13.
//

import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}

// 自定义的 environment object必须遵从ObservableObject协议且必须是一个'class'才可以。目的是为了让所有的subview可以访问其中的数据而不需要额外的传递Binding或者State给subview
class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = [] // 被'@Published'修饰的var，无论什么时候其值改变时，它将发布自身到所有subscribers那儿，系统会重构所有受影响的viewsZ
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if today.isSameDay(as: exerciseDays[0].date) {
            print("Adding \(exerciseName)")
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
        }
    }
}



