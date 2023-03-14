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
struct HistoryStore {
  var exerciseDays: [ExerciseDay] = []
    init() {
        #if DEBUG
        createDevData()
        #endif
    }
}



