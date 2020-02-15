//
//  EducatorModel.swift
//  oraculo
//
//  Created by otavio on 12/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

class EducatorModel: ObservableObject {
    
    @Published var educators: [Educator]
    
    init() {
        educators = DataFactory.generateMockEducatorArray()
    }

}
