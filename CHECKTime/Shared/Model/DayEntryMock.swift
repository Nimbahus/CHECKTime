//
//  DayEntryMock.swift
//  CHECKTime
//
//  Created by Nima Rahrakhshan on 12.05.23.
//

import Foundation

#if DEBUG
    enum DayEntryMock {
        static let mo = Date(timeIntervalSince1970: 1683497800)
        static let tu = Date(timeIntervalSince1970: 1683584200)
        static let we = Date(timeIntervalSince1970: 1683670600)
        static let th = Date(timeIntervalSince1970: 1683757000)
        static let fr = Date(timeIntervalSince1970: 1683843400)
    
        static let dayEntries: [DayEntry] =
            [
                .init(
                    id: UUID(),
                    activities: [
                        DayActivity(
                            startDate: mo,
                            endDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 10000),
                            tag: Tag(
                                label: Activity.meeting.name,
                                colorHex: Activity.meeting.color
                            )
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 10000),
                            endDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 15000),
                            tag: Tag(
                                label: Activity.dailyBreak.name,
                                colorHex: Activity.dailyBreak.color
                            )
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 15000),
                            endDate: Date(timeIntervalSince1970: mo.timeIntervalSince1970 + 28000),
                            tag: Tag(
                                label: Activity.meeting.name,
                                colorHex: Activity.meeting.color
                            )
                        ),
                    ]
                ),
                .init(
                    id: UUID(),
                    activities: [
                        DayActivity(
                            startDate: we,
                            endDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 10000),
                            tag: Tag(
                                label: Activity.meeting.name,
                                colorHex: Activity.meeting.color
                            )
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 10000),
                            endDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 15000),
                            tag: Tag(
                                label: Activity.dailyBreak.name,
                                colorHex: Activity.dailyBreak.color
                            )
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 15000),
                            endDate: Date(timeIntervalSince1970: we.timeIntervalSince1970 + 22800),
                            tag: Tag(
                                label: Activity.meeting.name,
                                colorHex: Activity.meeting.color
                            )
                        ),
                    ]
                ),
                .init(
                    id: UUID(),
                    activities: [
                        DayActivity(
                            startDate: th,
                            endDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 10000),
                            tag: Tag(
                                label: Activity.meeting.name,
                                colorHex: Activity.meeting.color
                            )
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 10000),
                            endDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 15000),
                            tag: Tag(
                                label: Activity.dailyBreak.name,
                                colorHex: Activity.dailyBreak.color
                            )
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 15000),
                            endDate: Date(timeIntervalSince1970: th.timeIntervalSince1970 + 28800),
                            tag: Tag(
                                label: Activity.meeting.name,
                                colorHex: Activity.meeting.color
                            )
                        ),
                    ]
                ),
                .init(
                    id: UUID(),
                    activities: [
                        DayActivity(
                            startDate: fr,
                            endDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 10000),
                            tag: Tag(
                                label: Activity.meeting.name,
                                colorHex: Activity.meeting.color
                            )
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 10000),
                            endDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 15000),
                            tag: Tag(
                                label: Activity.dailyBreak.name,
                                colorHex: Activity.dailyBreak.color
                            )
                        ),
                        DayActivity(
                            startDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 15000),
                            endDate: Date(timeIntervalSince1970: fr.timeIntervalSince1970 + 30800),
                            tag: Tag(
                                label: Activity.meeting.name,
                                colorHex: Activity.meeting.color
                            )
                        ),
                    ]
                ),
            ]
    }

#endif
