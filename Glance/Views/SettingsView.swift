//
//  SettingsView.swift
//  Glance
//
//  Created by Luke Drushell on 7/5/21.
//

import SwiftUI

struct SettingsView: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                List {
                    NavigationLink("Display Settings", destination: {
                        
                    })
                    NavigationLink("Location Settings", destination: {
                        
                    })
                    Button {
                        
                    } label: {
                        Text("Settings Button")
                    }
                } .frame(height: 300)
                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
