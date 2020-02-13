//
//  EducatorModel.swift
//  oraculo
//
//  Created by otavio on 12/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

class EducatorModel: ObservableObject {
    
    @Published var educators: [Educator] {
        didSet {
            print("mudou")
        }
    }
    
    init() {
        educators = [
            Educator(name: "Eliane", email: "Marcelo@gmail.com", accessLevel: .admin),
            Educator(name: "Marcelo", email: "Marcelo@gmail.com", accessLevel: .editor),
            Educator(name: "Adilson", email: "Adilson@bol.com.br", accessLevel: .user),
            Educator(name: "Maria", email: "Maria@hotmail.com", accessLevel: .admin),
            Educator(name: "Cleusa", email: "Cleusa@assembleiadedeus.org", accessLevel: .user)
        ]
    }
    

}
