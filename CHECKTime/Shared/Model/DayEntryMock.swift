//
//  DayEntryMock.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

#if DEBUG
    enum DayEntryMock {
        static let mo = Date(timeIntervalSince1970: 1683496800)
        static let tu = Date(timeIntervalSince1970: 1683583200)
        static let we = Date(timeIntervalSince1970: 1683669600)
        static let th = Date(timeIntervalSince1970: 1683756000)
        static let fr = Date(timeIntervalSince1970: 1683842400)
    
        static let dayEntries: [DayEntry] =
            [
                .init(
                    activities: [
                        DayActivity(
                            startDate: mo,
                            endDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 10000),
                            color: "work", activityType: .work
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 10000),
                            endDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 15000),
                            color: "break", activityType: .dailyBreak
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 15000),
                            endDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 28000),
                            color: "work", activityType: .work
                        ),
                    ]
                ),
                .init(
                    activities: [
                        DayActivity(
                            startDate: tu,
                            endDate:
                            Date(timeIntervalSince1970: tu.timeIntervalSince1970 + 10000),
                            color: "work", activityType: .work
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: tu.timeIntervalSince1970 + 10000),
                            endDate: Date(timeIntervalSince1970: tu.timeIntervalSince1970 + 15000),
                            color: "break", activityType: .dailyBreak
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: tu.timeIntervalSince1970 + 15000),
                            endDate: Date(timeIntervalSince1970: tu.timeIntervalSince1970 + 27500),
                            color: "work", activityType: .work
                        ),
                    ]
                ),
                .init(
                    activities: [
                        DayActivity(
                            startDate: we,
                            endDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 10000),
                            color: "work", activityType: .work
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 10000),
                            endDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 15000),
                            color: "break", activityType: .dailyBreak
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 15000),
                            endDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 22800),
                            color: "work", activityType: .work
                        )
                    ]
                ),
                .init(
                    activities: [
                        DayActivity(
                            startDate: th,
                            endDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 10000),
                            color: "work", activityType: .work
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 10000),
                            endDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 15000),
                            color: "break", activityType: .dailyBreak
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 15000),
                            endDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 28800),
                            color: "work", activityType: .work
                        )
                    ]
                ),
                .init(
                    activities: [
                        DayActivity(
                            startDate: fr,
                            endDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 10000),
                            color: "work", activityType: .work
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 10000),
                            endDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 15000),
                            color: "break", activityType: .dailyBreak
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 15000),
                            endDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 30800),
                            color: "work", activityType: .work
                        )
                    ]
                ),
            ]
    }

#endif
