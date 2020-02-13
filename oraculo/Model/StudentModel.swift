//
//  Model.swift
//  oraculo
//
//  Created by otavio on 10/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

class StudentModel {
    
    @State var students: [Student]
    
    init() {
        students = [
            Student(name: "Otavio", grade: "8", className: "C", occurrences: [], terms: []),
            Student(name: "Gabriel", grade: "7", className: "D", occurrences: [], terms: []),
            Student(name: "Jorge", grade: "7", className: "D", occurrences: [], terms: []),
            Student(name: "Adamastor", grade: "2", className: "A", occurrences: [], terms: []),
            Student(name: "Pedrinho", grade: "4", className: "D", occurrences: [], terms: [])
        ]
    }
    
    func referenceBy(id: Int) -> Student {
        let index = students.firstIndex(where: { $0.id == id } )!
        return students[index]
    }
    
    func referenceFrom(_ s: Student) -> Student {
        let index = students.firstIndex(where: { $0.id == s.id } )!
        return students[index]
    }
}


