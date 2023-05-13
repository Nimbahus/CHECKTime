//
//  ActivityListViewmodel.swift
//  CHECKTime
//
//  Created by Vasili Baramidze on 13.05.23.
//

import Foundation

class ActivityListViewModel: ObservableObject, Identifiable {
    
    struct ActivityListItem: Identifiable {
        var id = UUID()
        var activity: DayActivity
        var totalDuration: TimeInterval
        var row: Int
    }
    
    var activities: [DayActivity]

    init(activities: [DayActivity]) {
        self.activities = activities
    }
    
    var groupedActivities: [ActivityListItem] {

        var grouped = [ActivityListItem]()
        
        for activity in activities {
            if let index = grouped.firstIndex(where: { $0.activity.tag.activity.name == activity.tag.activity.name }) {
                grouped[index].totalDuration += activity.duration
            } else {
                grouped.append(ActivityListItem(activity: activity, totalDuration: activity.duration, row: grouped.count))
            }
        }
        
        return grouped
    }
}
