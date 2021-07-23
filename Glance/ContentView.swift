//
//  ContentView.swift
//  Glance
//
//  Created by Luke Drushell on 7/5/21.
//

import SwiftUI
import CoreData




struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var toggles: FetchedResults<SettingsToggle>
    
    @Environment(\.colorScheme) var colorScheme
    @Environment (\.colorScheme) var colorScheme3
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        if colorScheme3 == .dark {
            UITableViewCell.appearance().backgroundColor = .darkGray
            //UITabBar.appearance().backgroundColor = UIColor.darkGray
            print("dark mode")
        } else {
            UITableViewCell.appearance().backgroundColor = .white
            //UITabBar.appearance().backgroundColor = UIColor.white
            print("light mode")
            print(colorScheme3)
        }
    }
    
    var body: some View {
        ZStack {
            TabView() {
                HomeView()
                    .tabItem({Label("Weather", systemImage: "cloud.sun.fill")})

                SettingsView()
                    .tabItem({Label("Settings", systemImage: "gear")})
            }
        } .accentColor(.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
