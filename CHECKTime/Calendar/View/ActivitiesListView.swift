//
//  ActivitiesListView.swift
//  CHECKTime
//
//  Created by Vasili Baramidze on 12.05.23.
//

import SwiftUI
import Charts

struct ActivitiesListView: View {
    
    var activities: [DayActivity]

    var body: some View {
        VStack {
            Chart(activities) { item in
                BarMark(
                    y: .value("task", item.endDate)
                )
                .foregroundStyle(.linearGradient(
                    colors: [.blue, .red],
                    startPoint: .leading,
                    endPoint: .trailing)
                )
                .annotation(position: .top, alignment: .leading, spacing: 10) {
                    Text(item.activityType.name)

                }
                .annotation(position: .trailing) {
                    Text("item.duration")
                }
                .annotation(position: .leading){
                    HStack(alignment: .top) {
                        Image(systemName: item.activityType.iconName)
//                            .resizable()
//                            .frame(height: 50)
                            .font(.system(size: 40))
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .cornerRadius(10)
            }
            .chartYAxis(Visibility.hidden)
            .padding(100)
        }
    }
}

struct ActivitiesListView_Previews: PreviewProvider {
    static var previews: some View {
            
        ActivitiesListView(activities: [
            DayActivity(startDate: Date.now, endDate: Date.now.addingTimeInterval(10000), color: "#00000", activityType: .work),
            DayActivity(startDate: Date.now, endDate: Date.now.addingTimeInterval(9000), color: "#00000", activityType: .dailyBreak),
            DayActivity(startDate: Date.now, endDate: Date.now.addingTimeInterval(8000), color: "#00000", activityType: .meeting)
        ])
    }
}
