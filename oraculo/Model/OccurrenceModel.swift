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
            OccurrenceReference(text: "0 - Description of occurrence", isActive: false),
            OccurrenceReference(text: "1 - Description of occurrence", isActive: false),
            OccurrenceReference(text: "2 - Description of occurrence", isActive: false),
            OccurrenceReference(text: "3 - Description of occurrence", isActive: false),
            OccurrenceReference(text: "4 - Description of occurrence", isActive: false),
            OccurrenceReference(text: "5 - Description of occurrence", isActive: false),
            OccurrenceReference(text: "6 - Description of occurrence", isActive: false)
        ]
    }
    
    func resetReferencesState() {
        self.references.forEach({ $0.isActive = false })
    }
}
