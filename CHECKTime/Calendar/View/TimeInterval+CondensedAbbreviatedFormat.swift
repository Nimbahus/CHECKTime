//
//  TimeInterval+CondensedAbbreviatedFormat.swift
//  CHECKTime
//
//  Created by David Schmöker on 12.05.23.
//

import Foundation

extension TimeInterval {
    func condensedAbbreviatedFormat() -> String {
        let date: String = (Date()..<Date().addingTimeInterval(self))
            .formatted(.components(style: .condensedAbbreviated))
        return date
    }
}
