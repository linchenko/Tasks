//
//  Task+Convenience.swift
//  ToDoList
//
//  Created by Levi Linchenko on 29/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import Foundation
import CoreData


extension Task{
    
    @discardableResult
    convenience init(title: String, completeBy: Date, taskDesription: String, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.title = title
        self.completeBy = completeBy
        self.taskDescription = taskDesription
    }
    
}


