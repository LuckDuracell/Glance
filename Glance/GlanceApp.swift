//
//  GlanceApp.swift
//  Glance
//
//  Created by Luke Drushell on 7/5/21.
//

import SwiftUI

@main
struct GlanceApp: App {
    
    let persistanceContainer = PersistanceController.shared
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceContainer.container.viewContext)
        }
    }
}
