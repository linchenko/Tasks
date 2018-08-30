//
//  CoreDataStack.swift
//  ToDoList
//
//  Created by Levi Linchenko on 29/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error{
                fatalError("Failure with persistent store \(error)")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    static func saveToDisk(){
        do {
            try CoreDataStack.context.save()
        }  catch {
            print("There was an error in \(#function) \(error) \(error.localizedDescription)")
        }
    }
    
    
}
