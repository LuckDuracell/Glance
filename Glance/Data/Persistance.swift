//
//  Persistance.swift
//  Persistance
//
//  Created by Luke Drushell on 7/22/21.
//

import Foundation
import CoreData

struct PersistanceController {
  static let shared = PersistanceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "data")
        
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
        
        
        
    }
    
}
