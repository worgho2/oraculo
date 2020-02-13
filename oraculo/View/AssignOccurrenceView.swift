//
//  AssignOccurrenceView.swift
//  oraculo
//
//  Created by otavio on 11/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

struct AssignOccurrenceView: View {
    
    @State private var occurrenceModel = OccurrenceModel()
       
    @Binding public var student: Student
    
    @Binding public var showingModal: Bool
    @State private var showingAlert: Bool = false
    @State private var occurrenceDate = Date()
    
    var body: some View {
        NavigationView {

            Form {
                
                Section(header: Text("Occurrences")) {
                    List(occurrenceModel.references) { reference in
                        HStack { 
                            Toggle(isOn: self.$occurrenceModel.references[self.occurrenceModel.references.firstIndex(where: { $0.id == reference.id })!].isActive) {
                                Text("\(reference.text)")
                            }
                        }
                    }
                }
                
                Section(header: Text("Date")) {
                    DatePicker(selection: $occurrenceDate, in: ...Date(), displayedComponents: .date) {
                        Text("Select a date")
                    }
                }
                
            }
                
            .navigationBarTitle(Text("Assign Occurrence"), displayMode: .inline)
            .navigationBarItems(leading:
                
                Button(action: {
                    self.showingModal = false
                }) {
                    Text("Cancel")
                }
                .frame(height: 40)
                
            , trailing:
                
                Button(action: {
                    self.onDone()
                }) {
                    Text("Done")
                }
                .frame(height: 40)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Select at least one occurrence"), dismissButton: .default(Text("Ok")))
                }
                
            )

        }
    }
    
    private func onDone() {
        if !occurrenceModel.references.map({ $0.isActive }).contains(true) {
            showingAlert = true
            return
        }
        
        for (index, item) in occurrenceModel.references.map({ $0.isActive }).enumerated() {
            if item {
                let occurrence = Occurrence(reference: occurrenceModel.references[index], data: occurrenceDate)
                
                EducatorSingleton.instance.current.assignOccurrence(to: student, occurrence: occurrence)
            }
            
        }
        
        occurrenceModel.resetReferencesState()
        showingModal = false
    }
}

struct AssignOccurrenceView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
