//
//  OccurrenceModel.swift
//  oraculo
//
//  Created by otavio on 12/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import Foundation

class OccurrenceModel: ObservableObject {
    
    @Published var references: [OccurrenceReference]
    
    init() {
        references = DataFactory.generateMockOccurenceReferenceArray()
    }
    
    func resetReferencesState() {
        self.references.forEach({ $0.isActive = false })
    }
}
