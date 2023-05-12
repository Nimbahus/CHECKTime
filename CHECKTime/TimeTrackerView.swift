//
//  TimeTrackerView.swift
//  CHECKTime
//
//  Created by Maurizio Volanti on 12.05.23.
//

import SwiftUI
import CoreData

protocol TimeTrackerViewDelegate: AnyObject {
    func didStartTimer(currentSeconds: Int)
    func didPauseTimer(currentSeconds: Int)
}

class TimeTrackerViewModel: ObservableObject, Identifiable {
    @Published var maxSeconds: Int
    @Published var currentSeconds: Int
    @Published var maxTimeAvailable: Bool
    @Published var progressBarColor: Color = .pink
    @Published var delegate: TimeTrackerViewDelegate?

    init(maxSeconds: Int, currentSeconds: Int = 0, delegate: TimeTrackerViewDelegate? = nil) {
        self.maxSeconds = maxSeconds
        self.currentSeconds = currentSeconds
        self.delegate = delegate
        self.maxTimeAvailable = maxSeconds != 0
    }
    
    func updateColor(color: Color) {
        self.progressBarColor = color
    }
}

struct TimeTrackerView: View {
    @ObservedObject var model: TimeTrackerViewModel

    @State var trackerButtonImageSource: String = "play.fill"
    @State var isPaused: Bool = true
    
    @State var timerText = ""
    @State var progress: Double = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(timerText)
                .font(.largeTitle)
                .bold()
                .onReceive(timer) { _ in
                    if !isPaused {
                        updateTimer()
                    }
                }
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
                    onControllButton()
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
    
    func onControllButton() {
        isPaused.toggle()
        if isPaused {
            model.delegate?.didPauseTimer(currentSeconds: model.currentSeconds)
            trackerButtonImageSource = "play.fill"
        } else {
            model.delegate?.didStartTimer(currentSeconds: model.currentSeconds)
            trackerButtonImageSource = "pause.fill"
        }
    }
    
    func updateTimer() {
        model.currentSeconds += 1
        if model.maxTimeAvailable && model.currentSeconds < model.maxSeconds {
            timerText = prettyPrintSecondsLeft(seconds: model.maxSeconds - model.currentSeconds)
            progress = Double(model.currentSeconds) / Double(model.maxSeconds)
        } else {
            timerText = prettyPrintSecondsLeft(seconds: model.currentSeconds)
            progress = Double(model.currentSeconds % 3600) / Double(3600)
        }
    }
    
    func prettyPrintSecondsLeft(seconds: Int) -> String {
        let hour = seconds / 3600
        let minute = seconds / 60 % 60
        let second = seconds % 60

        return String(format: "%02i:%02i:%02i", hour, minute, second)
    }
}


struct TimeTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        let model = TimeTrackerViewModel(maxSeconds: 28800)
        TimeTrackerView(model: model)
    }
}
