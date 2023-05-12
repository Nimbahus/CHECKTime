//
//  TimeTrackerView.swift
//  CHECKTime
//
//  Created by Maurizio Volanti on 12.05.23.
//

import SwiftUI
import CoreData

struct TimeTrackerView: View {
    @ObservedObject var model: TimeTrackerViewModel

    @State var trackerButtonImageSource: String = "play.fill"
    @State var isPaused: Bool = true
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ZStack {
                    Circle()
                        .stroke(
                            model.progressBarColor.opacity(0.5),
                            lineWidth: 30
                        )
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            model.progressBarColor,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        .animation(.easeOut, value: progress)

                }
                Button {
                    onControlButton()
                } label: {
                    Image(systemName: trackerButtonImageSource)
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                }
                .buttonStyle(PlainButtonStyle())
                .controlSize(.large)
            }.frame(width: 200, height: 200)
            Spacer()
        }
    }
    
    func onControlButton() {
        isPaused.toggle()
        if isPaused {
            model.delegate?.didPauseTimer(currentSeconds: model.currentSeconds)
            trackerButtonImageSource = "play.fill"
        } else {
            model.delegate?.didStartTimer(currentSeconds: model.currentSeconds)
            trackerButtonImageSource = "pause.fill"
        }
    }
    
}


struct TimeTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        let model = TimeTrackerViewModel(maxSeconds: 28800)
        TimeTrackerView(model: model)
    }
}
