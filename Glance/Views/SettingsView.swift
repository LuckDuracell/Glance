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
                    Button {
                        
                    } label: {
                        Text("Settings Button")
                    }
                    Button {
                        
                    } label: {
                        Text("Settings Button")
                    }
                    Button {
                        
                    } label: {
                        Text("Settings Button")
                    }
                } .frame(height: 300)
                .padding(.bottom, -100)
                List {
                    Button {
                        
                    } label: {
                        Text("Settings Button")
                    }
                    Button {
                        
                    } label: {
                        Text("Settings Button")
                    }
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
