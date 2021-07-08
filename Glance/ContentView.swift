//
//  ContentView.swift
//  Glance
//
//  Created by Luke Drushell on 7/5/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemGray4
    }
    
    var body: some View {
        ZStack {
            TabView() {
                HomeView()
                    .tabItem({Label("Weather", systemImage: "cloud.sun.fill")})
                    .environment(\.colorScheme, .dark)

                SettingsView()
                    .tabItem({Label("Settings", systemImage: "gear")})
                    .environment(\.colorScheme, .light)
            }
        } .accentColor(.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
