//
//  ModelController.swift
//  ToDoList
//
//  Created by Levi Linchenko on 29/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import Foundation
import CoreData

class ModelController{
    
    static let shared = ModelController()
    
    var tasks: [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
        
    }
    
    func create(title: String, completedBy: Date, taskDescription: String){
        Task(title: title, completeBy: completedBy, taskDesription: taskDescription)
        CoreDataStack.saveToDisk()
        
    }
    
    func remove(task: Task){
        CoreDataStack.context.delete(task)
        CoreDataStack.saveToDisk()
    }
    
    func update(task: Task, title: String, taskDescription: String, completeBy: Date){
        task.title = title
        task.taskDescription = taskDescription
        task.completeBy = completeBy
    }
    
    
}
