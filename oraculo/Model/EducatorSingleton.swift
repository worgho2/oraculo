//
//  EducatorModel.swift
//  oraculo
//
//  Created by otavio on 12/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

class EducatorSingleton: ObservableObject{
    static let instance = EducatorSingleton()
    
    @Published var current: Educator
    
    private init() {
        current = Educator(name: "Otávio Baziewicz", email: "otavio@email.com", accessLevel: .admin)
    }
}
