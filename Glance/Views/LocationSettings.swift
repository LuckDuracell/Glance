//
//  LocationSettings.swift
//  Glance
//
//  Created by Luke Drushell on 7/10/21.
//

import SwiftUI

struct LocationSettings: View {
    
    @State var goBack = false
    @State var automaticLocation = true
    @State var location = "New York City, NY"
    
    @Environment(\.colorScheme) var colorScheme
    init() {
        UITableView.appearance().backgroundColor = .clear
        if colorScheme == .dark {
            UITableViewCell.appearance().backgroundColor = .orange
        } else {
            UITableViewCell.appearance().backgroundColor = .white
        }
    }
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            goBack = true
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                        Text("Back")
                            .foregroundColor(.white)
                    }
                    .padding()
                    Spacer()
                }
                
                //Location Settings View
                List {
                    Toggle("Automatic Location", isOn: $automaticLocation)
                        .toggleStyle(SwitchToggleStyle(tint: .pink))
                    if automaticLocation != true {
                      TextField("City Name, State Abbreviation", text: $location)
                    } else {
                        Text(location)
                            .foregroundColor(.gray)
                    }
                } .onAppear(perform: {
                    //location = locationFile
                })
                //-----------
                
                Spacer()
            }
            if goBack {
                SettingsView()
                    .transition(.move(edge: .leading))
            }
        }
    }
}

struct LocationSettings_Previews: PreviewProvider {
    static var previews: some View {
        LocationSettings()
    }
}
