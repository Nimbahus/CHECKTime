//
//  ActivitiesListView.swift
//  CHECKTime
//
//  Created by Vasili Baramidze on 12.05.23.
//

import Charts
import SwiftUI

struct ActivitiesListView: View {
    var activities: [DayActivity]

    var body: some View {
        VStack {
            Chart(activities) { item in
                BarMark(
                    y: .value("task", item.endDate ?? Date.now)
                )
                .foregroundStyle(.linearGradient(
                    colors: [.blue, .red],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                )
                .annotation(position: .top, alignment: .leading, spacing: 10) {
                    Text(item.tag.activity.name)
                }
                .annotation(position: .trailing) {
                    Text("item.duration")
                }
                .annotation(position: .leading) {
                    HStack(alignment: .top) {
                        Image(systemName: item.tag.activity.iconName)
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
        ActivitiesListView(activities: DayEntryMock.dayEntries.first!.activities)
    }
}
