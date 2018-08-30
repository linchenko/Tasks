//
//  DetailedTaskTableViewController.swift
//  ToDoList
//
//  Created by Levi Linchenko on 29/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class DetailedTaskTableViewController: UITableViewController {

    @IBOutlet weak var titleOutlet: UITextField!
    @IBOutlet weak var completedByTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let titleOutlet = titleOutlet.text, titleOutlet != "" else {return}
        if let task = task {
            ModelController.shared.update(task: task, title: titleOutlet, taskDescription: descriptionTextView.text, completeBy: Date())
        } else {
            ModelController.shared.create(title: titleOutlet, completedBy: Date(), taskDescription: descriptionTextView.text)
        }
    }
    
    var task: Task?

    func updateView(){
        titleOutlet.text = task?.title
        completedByTextField.text = "\(task?.completeBy ?? Date())"
        descriptionTextView.text = task?.taskDescription
    }

   

   
    @IBAction func SaveButtonTapped(_ sender: Any) {
        if titleOutlet.text != ""{
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    
  
   

}
