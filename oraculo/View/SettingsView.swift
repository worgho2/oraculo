//
//  SettingsView.swift
//  oraculo
//
//  Created by otavio on 11/02/20.
//  Copyright © 2020 Raieiros Studio. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        Form {
            Section(header: Text("Profile")) {
                HStack {
                    NavigationLink(destination: ProfileView()) {
                        Image("avatar")
                               .resizable()
                               .clipShape(Circle())
                               .shadow(radius: 10)
                               .frame(width: 70, height: 70)
                        VStack(alignment: .leading) {
                            Text("\(EducatorSingleton.instance.current.name)").bold()
                            Text("\(EducatorSingleton.instance.current.email)").font(.footnote)
                        }
                    }
                }
            }
            
            if EducatorSingleton.instance.current.accessLevel == .admin {
                Section(header: Text("Admin Features")) {
                    HStack {
                        NavigationLink(destination: EducatorView()) {
                            Text("Educator's access level")
                        }
                    }
                }
            }
        }
            
        .navigationBarTitle(Text("Settings"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
