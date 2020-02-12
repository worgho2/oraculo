//
//  StudentView.swift
//  oraculo
//
//  Created by otavio on 10/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

struct StudentView: View {
    
    @Binding public var student: Student
    
    @State private var showingSheet = false
    @State public var showingModal = false
    @State private var modalSelection = 0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {

        HStack {
            List(student.occurrences) { occurrence in
                HStack {
                    Text(occurrence.reference.text).bold()
                    Spacer()
                    Text("\(occurrence.data, formatter: self.dateFormatter)")
                }
            }
        }
            
        .navigationBarTitle(student.name)
        .navigationBarItems(trailing:

            Button(action: {
                self.showingSheet = true
            }) {
                Image(systemName: "plus").imageScale(.large)
            }
            .frame(width: 40, height: 40)

            .actionSheet(isPresented: $showingSheet) {
                ActionSheet(title: Text("Choose an option"), message: nil, buttons: [
                    .default(Text("Assign Occurrence"), action: {
                        self.showingModal = true
                        self.modalSelection = 0
                    }),
                    .default(Text("Print Term"), action: {
                        self.showingModal = true
                        self.modalSelection = 1
                    }),
                    .cancel()
                ])
            }

            .sheet(isPresented: $showingModal) {
                if self.modalSelection == 0 {
                    AssignOccurrenceView(student: self.$student, showingModal: self.$showingModal)
//                    AssignOccurrenceView(studentModel: self.$studentModel, studentId: self.studentId, showingModal: self.$showingModal)
                } else if self.modalSelection == 1 {
                    PrintTermView()
                }
            }

        )
    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        Text("a")
    }
}
