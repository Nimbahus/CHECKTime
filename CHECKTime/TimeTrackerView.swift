//
//  TimeTrackerView.swift
//  CHECKTime
//
//  Created by Maurizio Volanti on 12.05.23.
//

import SwiftUI
import CoreData

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.pink.opacity(0.5),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.pink,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)

        }
    }
}

struct TimeTrackerView: View {
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                CircularProgressView(progress: progress)
                Text("\(progress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
            }.frame(width: 200, height: 200)
            Spacer()
            HStack {
                Slider(value: $progress, in: 0...1)
                Button("Reset") {
                    resetProgress()
                }.buttonStyle(.borderedProminent)
            }
        }
    }
    
    func resetProgress() {
        progress = 0
    }
}


struct TimeTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTrackerView()
    }
}
