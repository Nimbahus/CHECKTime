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
    @State var progress: Double = 0
    @State var timerViewModel: TimerView.ViewModel = TimerView.ViewModel(startDate: Date(), isPaused: true)
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            TimerView(viewModel: timerViewModel)
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
                        .onReceive(timer) { _ in
                            updateProgressBar()
                        }
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
    
    func updateProgressBar() {
        if model.maxTimeAvailable && timerViewModel.getPassedSeconds() < model.maxSeconds {
            progress = Double(timerViewModel.getPassedSeconds()) / Double(model.maxSeconds)
        } else {
            progress = Double(timerViewModel.getPassedSeconds() % 3600) / Double(3600)
        }
    }
    
    func onControlButton() {
        timerViewModel.isPaused.toggle()
        if timerViewModel.isPaused {
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
