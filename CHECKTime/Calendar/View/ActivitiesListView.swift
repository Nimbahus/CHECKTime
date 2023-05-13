//
//  ActivitiesListView.swift
//  CHECKTime
//
//  Created by Vasili Baramidze on 12.05.23.
//

import SwiftUI
import Charts

struct ActivitiesListView: View {
        
    @ObservedObject var viewModel: ActivityListViewModel
    let itemSize = 100
    
    var body: some View {
        Chart {
            ForEach(viewModel.groupedActivities) { listItem in
                
                BarMark(
                    x: .value("value", listItem.totalDuration),
                    y: .value("type", listItem.activity.tag.activity.name)
                )
                .annotation(position: .top, alignment: .leading, spacing: 10) {
                    Text(listItem.activity.tag.activity.name)
                }
                .annotation(position: .trailing) {
                    Text(listItem.totalDuration.condensedAbbreviatedFormat())
                }
                .annotation(position: .leading){
                    HStack(alignment: .top) {
                        Image(systemName: listItem.activity.tag.activity.iconName)
                            .font(.system(size: 40))
                    }
                }
                .cornerRadius(10)
            }
        }
        .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
        .chartXAxis(Visibility.hidden)
        .chartYAxis(Visibility.hidden)
        .padding(.horizontal, 100)
        .padding(.top, 10)
        .frame(height: CGFloat(viewModel.groupedActivities.count) * CGFloat(itemSize))
    }
}
