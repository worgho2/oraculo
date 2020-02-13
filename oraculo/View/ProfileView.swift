//
//  ProfileView.swift
//  oraculo
//
//  Created by otavio on 13/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State var name: String = EducatorSingleton.instance.current.name
    
    @State var email: String = EducatorSingleton.instance.current.email
    
    var body: some View {
        Form {
            Section(header: Text("Info")) {
                HStack {
                    Image("avatar")
                        .resizable()
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .frame(width: 70, height: 70)
                    VStack(alignment: .leading) {
                        Text("Access Level:").bold() + Text("\(EducatorSingleton.instance.current.accessLevel.rawValue)")
                        Text("Id: ").bold() + Text("\(EducatorSingleton.instance.current.id)")
                    }
                }
                
            }
            Section(header: Text("Name")) {
                TextField(name, text: $name)
            }
            Section(header: Text("Email")) {
                TextField(email, text: $email)
            }
            
            .navigationBarTitle(Text("Edit Profile"))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
