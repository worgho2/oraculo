//
//  Educator.swift
//  oraculo
//
//  Created by otavio on 10/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import Foundation

class Educator: Identifiable {
    static var next_id = 0
    
    let id: Int
    let name: String
    let email: String
    
    init(name: String, email: String) {
        self.id = Educator.next_id
        Educator.next_id += 1
        
        self.name = name
        self.email = email
    }
    
    func assignOccurrence(to student: Student, occurrence: Occurrence) {
        occurrence.assignedBy = self
        student.occurrences.append(occurrence)
    }
}
