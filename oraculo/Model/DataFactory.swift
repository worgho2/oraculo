//
//  DataFactory.swift
//  oraculo
//
//  Created by otavio on 14/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import Foundation

class DataFactory {
    
    static let occurrenceReferences = [
        OccurrenceReference(text: "Didn't do the homework", isActive: false),
        OccurrenceReference(text: "Excessive talk", isActive: false),
        OccurrenceReference(text: "Chewing gum", isActive: false),
        OccurrenceReference(text: "Disrespect", isActive: false),
        OccurrenceReference(text: "Fight at break", isActive: false),
        OccurrenceReference(text: "Committed bullying", isActive: false),
        OccurrenceReference(text: "Using cell phone", isActive: false)
    ]
    
    enum DataType {
        case server
        case mock
    }
    
    enum CharSetType: String {
        case className = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        case name = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        case email = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    }
    
    static func randomString(length: Int, type: CharSetType) -> String {
        let charSet = type.rawValue.map({ String($0) })
        var output = String()
        
        for _ in 0..<length {
            output.append(charSet[Int(arc4random()) % charSet.count])
        }
        
        if type == .email {
            output.append("@email.com")
        }

        return output
    }
    
    static func generateMockStudentArray() -> [Student] {
        var students = [Student]()
        
        for _ in 0...Int.random(in: 10..<100) {
            let name = randomString(length: 10, type: .name)
            let className = randomString(length: 1, type: .className)
            let grade = Int.random(in: 1...9)
            
            let student = Student(name: name, grade: grade, className: className)
            
            student.occurrences = generateMockOccurrenceArray()
            student.terms = generateMockTermArray()
            
            students.append(student)
        }
            
        return students
    }
    
    static func generateMockOccurrenceArray() -> [Occurrence] {
        var occurrences = [Occurrence]()
        
        for _ in 0...Int.random(in: 10..<100) {
            let occurrenceReference = generateMockOccurrenceReference()
            let occurrence = Occurrence(reference: occurrenceReference, data: Date())
            
            occurrences.append(occurrence)
        }
        
        return occurrences
    }
    
    //ajustar com o fluxo
    static func generateMockOccurrenceReference() -> OccurrenceReference {
        return occurrenceReferences.randomElement()!
    }
    
    static func generateMockTermArray() -> [Term] {
        let terms = [Term]()
        //TODO
        return terms
    }
    
    static func generateMockOccurenceReferenceArray() -> [OccurrenceReference] {
        return self.occurrenceReferences
    }
    
    static func generateMockEducatorArray() -> [Educator] {
        var educators: [Educator] = [EducatorSingleton.instance.current]
        
        for _ in 0...Int.random(in: 10..<100) {
            let name = randomString(length: 10, type: .name)
            let email = randomString(length: 5, type: .email)
            let accessLevel = AccessLevel.allCases.randomElement()!
            
            let educator = Educator(name: name, email: email, accessLevel: accessLevel)
            
            educators.append(educator)
        }
        
        return educators
    }
    
}
