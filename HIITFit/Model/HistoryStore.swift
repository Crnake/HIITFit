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
    // 定义一个可能出现的错误的enum
    enum FileError: Error {
        case loadFailure
        case saveFailure
        case urlFailure
    }
    
    init(withChecking: Bool) throws {
        #if DEBUG
//        createDevData()
        #endif
        do {
            try load()
        } catch {
            throw error
        }
    }
    init() {}
    
    func load() throws {
        guard let dataURL = getURL() else {
            throw FileError.urlFailure
        }
        guard let data = try? Data(contentsOf: dataURL) else {
            return
        }
        let plistData = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
        let convertedPlistData = plistData as? [[Any]] ?? []
        exerciseDays = convertedPlistData.map { exerciseDay in
                ExerciseDay(date: exerciseDay[1] as? Date ?? Date(), exercises: exerciseDay[2] as? [String] ?? [])
        }
    }
    func getURL() -> URL? {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documentsURL.appendingPathComponent("history.plist")
    }
    func save() throws {
        guard let dataURL = getURL() else {
            throw FileError.urlFailure
        }
        let plistData:[[Any]] = exerciseDays.map { exerciseDay in
            [
                exerciseDay.id.uuidString,
                exerciseDay.date,
                exerciseDay.exercises
            ]
        }
        do {
            let data = try PropertyListSerialization.data(fromPropertyList: plistData, format: .binary, options: .zero)
            try data.write(to: dataURL, options: .atomic)
        } catch {
            throw FileError.saveFailure
        }
    }
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
        }
        do {
            try save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}







