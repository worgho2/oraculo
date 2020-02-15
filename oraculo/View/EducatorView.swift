//
//  EducatorView.swift
//  oraculo
//
//  Created by otavio on 12/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI
import Combine

struct EducatorView: View {
    @ObservedObject public var educatorsModel = EducatorModel()
    @State private var needLayoutUpdate: Bool = false
    
    @State var admin = AccessLevel.admin
    
    var body: some View {
        
        List {
            ForEach(self.educatorsModel.educators) { educator in
                HStack {
                    Image("avatar")
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .frame(width: 60, height: 60)
                    VStack(alignment: .leading) {
                        Text("\(educator.name)").bold()
                        Text("\(educator.email)").font(.footnote)
                    }
                    Picker("", selection: self.$educatorsModel.educators[self.educatorsModel.educators.firstIndex(where: {$0.id == educator.id})!].accessLevel) {
                        ForEach(AccessLevel.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                    }
                }
            }
//            ForEach(AccessLevel.allCases, id: \.self) { level in
//                Section(header: Text("\(level.rawValue)")) {
//                    ForEach(self.educatorsModel.educators.filter({ $0.accessLevel == level })) { educator in
//                        HStack {
//                            Image("avatar")
//                                .resizable()
//                                .clipShape(Circle())
//                                .shadow(radius: 10)
//                                .frame(width: 60, height: 60)
//                            VStack(alignment: .leading) {
//                                Text("\(educator.name)").bold()
//                                Text("\(educator.email)").font(.footnote)
//                            }
//                            Picker("", selection: self.$educatorsModel.educators[self.educatorsModel.educators.firstIndex(where: {$0.id == educator.id})!].accessLevel) {
//                                ForEach(AccessLevel.allCases, id: \.self) { Text($0.rawValue).tag($0) }
//                            }
//                        }
//                    }
//                }
//            }
        }
        .navigationBarTitle(Text("Educators"))
    }
    
    func educatorsFilteredBy(_ a: AccessLevel) -> [Educator] {
        switch a {
        case .admin:
            return self.educatorsModel.educators.filter({ $0.accessLevel == .admin })
        case .editor:
            return self.educatorsModel.educators.filter({ $0.accessLevel == .editor })
        case .user:
            return self.educatorsModel.educators.filter({ $0.accessLevel == .user })
        }
    }
}

struct EducatorView_Previews: PreviewProvider {
    static var previews: some View {
        EducatorView()
    }
}
