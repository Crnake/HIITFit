//
//  HistoryView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/11.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showHistory: Bool
    @EnvironmentObject var history: HistoryStore // 这里Swift应该是通过类型来判断Environment中的变量，但是如果有多个同类型的变量被申明为EnvironmentObject，如何识别需要的是哪一个？？？？？
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {showHistory.toggle() }) {
                Image(systemName: "xmark.circle")
            }.font(.title).padding(.trailing)
            VStack {
                Text("History")
                    .font(.title)
                .padding()
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section(header: Text(day.date.formatted(as: "MMM d")).font(.headline)) {
                          ForEach(day.exercises, id: \.self) { exercise in
                            Text(exercise)
                          }
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showHistory: .constant(true))
            .environmentObject(HistoryStore())
    }
}
