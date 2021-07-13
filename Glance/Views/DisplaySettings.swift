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
    
    @Environment(\.colorScheme) var colorScheme
    init() {
        UITableView.appearance().backgroundColor = .clear
        if colorScheme == .dark {
            UITableViewCell.appearance().backgroundColor = .orange
            UITabBar.appearance().backgroundColor = UIColor.systemGray4
        } else {
            UITableViewCell.appearance().backgroundColor = .white
            UITabBar.appearance().backgroundColor = UIColor.white
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
                
                //Display Settings View
                HStack {
                    Text("Colors:")
                        .bold()
                        .foregroundColor(.white.opacity(1))
                    Spacer()
                } .padding(.horizontal, 20)
                    .padding(.top, 40)
                List {
                    Toggle("Automatic", isOn: $automaticColors)
                        .toggleStyle(SwitchToggleStyle(tint: .pink))
                    Button {
                        if automaticColors != true {
                            withAnimation {
                                darkMode = false
                            }
                        }
                    } label: {
                        HStack {
                            Text("Light Mode")
                            Spacer()
                            if darkMode != true {
                            Image(systemName: "checkmark")
                                    .animation(.default)
                            }
                        }
                        .foregroundColor(automaticColors ? .gray : .pink)
                    }
                    Button {
                        if automaticColors != true {
                            withAnimation {
                                darkMode = true
                            }
                        }
                    } label: {
                        HStack {
                            Text("Dark Mode")
                            Spacer()
                            if darkMode {
                            Image(systemName: "checkmark")
                                    .animation(.default)
                            }
                        }
                        .foregroundColor(automaticColors ? .gray : .pink)
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
