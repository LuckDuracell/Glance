//
//  DisplaySettings.swift
//  Glance
//
//  Created by Luke Drushell on 7/10/21.
//

import SwiftUI

struct DisplaySettings: View {
    
    @State var goBack = false
    @State var automaticColors = true
    
    @State var darkMode = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .white
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
                
                //Display Settings View
                HStack {
                    Text("Colors:")
                        .foregroundColor(.white.opacity(1))
                    Spacer()
                } .padding(.horizontal, 20)
                    .padding(.top, 40)
                List {
                    Toggle("Automatic", isOn: $automaticColors)
                        .toggleStyle(SwitchToggleStyle(tint: .pink))
                    Button {
                        if automaticColors != true {
                            darkMode = false
                        }
                    } label: {
                        HStack {
                            Text("Light Mode")
                            Spacer()
                            Image(systemName: darkMode ? "" : "checkmark")
                        }
                        .foregroundColor(automaticColors ? .gray : .blue)
                    }
                    Button {
                        if automaticColors != true {
                            darkMode = true
                        }
                    } label: {
                        HStack {
                            Text("Dark Mode")
                            Spacer()
                            Image(systemName: darkMode ? "checkmark" : "")
                        }
                        .foregroundColor(automaticColors ? .gray : .blue)
                    }

                }
                .padding(.top, -35)
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

struct DisplaySettings_Previews: PreviewProvider {
    static var previews: some View {
        DisplaySettings()
    }
}
