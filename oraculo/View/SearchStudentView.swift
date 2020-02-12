//
//  SearchStudentView.swift
//  oraculo
//
//  Created by otavio on 05/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

struct SearchStudentView: View {
    
    //studentModel
    @State public var studentModel = StudentModel()
    
    //SearchBar
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    //Segmented Control
    @State private var pickerSelection = "all"

    var body: some View {

        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true)
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton)
                
                Picker("", selection: $pickerSelection) {
                    Text("All").tag("all")
                    Text("Name").tag("name")
                    Text("Class").tag("class")
                    Text("Grade").tag("grade")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List(filterStudents(studentModel.students)) { student in
                    NavigationLink(destination:
                        StudentView(student: self.$studentModel.students[self.studentModel.students.firstIndex(where: { $0.id == student.id })!])
                    ) {
                        Text("\(student.name) - ").bold() + Text("\(student.grade)\(student.className)")
                    }
                    
                }

                .navigationBarTitle(Text("Search Students"))
                .navigationBarItems(trailing:
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.crop.circle").imageScale(.large)
                        .frame(width: 40, height: 40)
                })
                
                .resignKeyboardOnDragGesture()
            }
        }
    }
    
    private func filterStudents(_ s: [Student]) -> [Student] {
        
        switch self.pickerSelection {
        case "all":
            return s.filter( { $0.name.lowercased().contains(searchText.lowercased()) || $0.className.lowercased().contains(searchText.lowercased()) || $0.grade.lowercased().contains(searchText.lowercased()) || searchText == "" } )
        case "name":
            return s.filter( { $0.name.lowercased().contains(searchText.lowercased()) || searchText == "" } )
        case "class":
            return s.filter( { $0.className.lowercased().contains(searchText.lowercased()) || searchText == "" } )
        case "grade":
            return s.filter( { $0.grade.lowercased().contains(searchText.lowercased()) || searchText == "" } )
        default:
            return s
        }
    }
}

struct SearchStudentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchStudentView()
                .environment(\.colorScheme, .dark)
            SearchStudentView()
                .environment(\.colorScheme, .light)
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
