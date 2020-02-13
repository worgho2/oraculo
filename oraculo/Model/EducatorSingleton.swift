//
//  EducatorModel.swift
//  oraculo
//
//  Created by otavio on 12/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

class EducatorSingleton {
    static let instance = EducatorSingleton()
    
    @State var current: Educator
    
    private init() {
        current = Educator(name: "Eliane", email: "eliane@gmail.com", accessLevel: .admin)
    }
}
