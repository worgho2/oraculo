//
//  OccurrenceModel.swift
//  oraculo
//
//  Created by otavio on 12/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import Foundation

class OccurrenceModel {
    
    var references: [OccurrenceReference]
    
    init() {
        references = [
            OccurrenceReference(text: "Didn't do the homework", isActive: false),
            OccurrenceReference(text: "Excessive talk", isActive: false),
            OccurrenceReference(text: "Chewing gum", isActive: false),
            OccurrenceReference(text: "Disrespect", isActive: false),
            OccurrenceReference(text: "Fight at break", isActive: false),
            OccurrenceReference(text: "Committed bullying", isActive: false),
            OccurrenceReference(text: "Using cell phone", isActive: false)
        ]
    }
    
    func resetReferencesState() {
        self.references.forEach({ $0.isActive = false })
    }
}
