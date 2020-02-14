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
    @State public var educatorsModel = EducatorModel()
    
    var body: some View {
        
        Form {
            if !educatorsFilteredBy(.admin).isEmpty {
                Section(header: Text("Admin") ) {
                    List(educatorsFilteredBy(.admin)) { educator in
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
                            Picker("", selection: self.$educatorsModel.educators[self.educatorsModel.educators.firstIndex(where: {  $0.id == educator.id})!].accessLevel) {
                                ForEach(AccessLevel.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                            }
                        }
                    }
                }
            }
                    
            if !educatorsFilteredBy(.editor).isEmpty {
                Section(header: Text("Editor") ) {
                    List(educatorsFilteredBy(.editor)) { educator in
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
                            Picker("", selection: self.$educatorsModel.educators[self.educatorsModel.educators.firstIndex(where: {  $0.id == educator.id})!].accessLevel) {
                                ForEach(AccessLevel.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                            }
                        }
                    }
                }
            }
            
            if !educatorsFilteredBy(.user).isEmpty {
                Section(header: Text("User") ) {
                    List(educatorsFilteredBy(.user)) { educator in
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
                            Picker("", selection: self.$educatorsModel.educators[self.educatorsModel.educators.firstIndex(where: {  $0.id == educator.id})!].accessLevel) {
                                ForEach(AccessLevel.allCases, id: \.self) { Text($0.rawValue).tag($0) }
                            }
                        }
                    }
                }
            }
            
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
