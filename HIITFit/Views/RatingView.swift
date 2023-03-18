//
//  RatingView.swift
//  HIITFit
//
//  Created by rnake on 2023/3/11.
//

import SwiftUI

struct RatingView: View {
    // AppStorage只允许存储下列类型: String Int Double Data Bool URL
    @AppStorage("ratings") private var ratings = "0000" // 每个UserDefaults都有唯一的key，这里key是'ratings'
    let exerciseIndex: Int
    @State private var rating = 0
    let maximumRating = 5
    let onColor = Color.red
    let offColor = Color.gray
    // fileprivate此修饰符仅允许在内部访问该方法
    fileprivate func convertRating() {
        let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
        let character = ratings[index]
        rating = character.wholeNumberValue ?? 0
    }
    
    var body: some View {
        HStack {
            ForEach(1 ..< maximumRating + 1) { index in
//                Image(systemName: "waveform.path.ecg")
//                    .foregroundColor(index > rating ? offColor : onColor)
//                    .onTapGesture {
//                        updateRating(index: index)
//                    }
//                    .onAppear {
//                        convertRating()
//                    }
//                    .onChange(of: ratings) { _ in
//                        convertRating()
//                    }
                Button(action: { updateRating(index: index) }) {
                    Image(systemName: "waveform.path.ecg")
                        .foregroundColor(index > rating ? offColor : onColor).font(.body)
                }
                .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
                .onChange(of: rating) { _ in
                    convertRating()
                }
                .onAppear {
                    convertRating()
                }
            }
        }.font(.largeTitle)
    }
    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
        ratings.replaceSubrange(index...index, with: String(rating))
    }
    
    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {
            ratings = ratings.padding(toLength: desiredLength, withPad: "0", startingAt: 0)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    @AppStorage("ratings") static var ratings: String?
    static var previews: some View {
        ratings = nil
         return RatingView(exerciseIndex: 0)
            .previewLayout(.sizeThatFits)
    }
}
