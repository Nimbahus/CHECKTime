//
//  TimeTrackerView.swift
//  CHECKTime
//
//  Created by Maurizio Volanti on 12.05.23.
//

import SwiftUI
import CoreData

protocol TimeTrackerViewDelegate: AnyObject {
    func didStartTimer()
    func didPauseTimer()
}

class TimeTrackerViewModel: ObservableObject, Identifiable {
    @Published var progress: Double
    @Published var currentTimer: String
    @Published var delegate: TimeTrackerViewDelegate?

    init(progress: Double, currentTimer: String, delegate: TimeTrackerViewDelegate? = nil) {
        self.progress = progress
        self.currentTimer = currentTimer
        self.delegate = delegate
    }
    
    func updateTimer(progress: Double, currentTimer: String) {
        self.progress = progress
        self.currentTimer = currentTimer
    }
}

struct TimeTrackerView: View {
    @ObservedObject var model: TimeTrackerViewModel

    @State var trackerButtonImageSource: String = "play.fill"
    @State var trackerIsActive: Bool = false
        
    var body: some View {
        VStack {
            Text(model.currentTimer)
                .font(.largeTitle)
                .bold()
            Spacer()
            ZStack {
                ZStack {
                    Circle()
                        .stroke(
                            Color.pink.opacity(0.5),
                            lineWidth: 30
                        )
                    Circle()
                        .trim(from: 0, to: CGFloat(model.progress))
                        .stroke(
                            Color.pink,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        .animation(.easeOut, value: model.progress)

                }
                Button {
                    trackerIsActive.toggle()
                    if trackerIsActive {
                        model.delegate?.didStartTimer()
                    } else {
                        model.delegate?.didPauseTimer()
                    }
                    trackerButtonImageSource = trackerIsActive ? "pause.fill" : "play.fill"
                    
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
}


struct TimeTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        let model = TimeTrackerViewModel(progress: 0.3, currentTimer: "HH:mm:ss")
        TimeTrackerView(model: model)
    }
}
