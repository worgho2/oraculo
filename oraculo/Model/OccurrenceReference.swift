//
//  OccurrenceReference.swift
//  oraculo
//
//  Created by otavio on 11/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import Foundation

class OccurrenceReference: Identifiable {
    static var next_id = 0
    
    var id: Int
    var text: String
    var isActive: Bool
    
    init(text: String, isActive: Bool) {
        self.id = OccurrenceReference.next_id
        OccurrenceReference.next_id += 1
        
        self.text = text
        self.isActive = isActive
    }
}
