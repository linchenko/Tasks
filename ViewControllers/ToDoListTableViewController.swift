//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Levi Linchenko on 29/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController, ButtonTableViewCellDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        tableView.reloadData()
    }

  

    // MARK: - Table view data source

    func buttonTapped(sender: ButtonTableViewCell) {
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ModelController.shared.tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buttonIdentifier", for: indexPath) as? ButtonTableViewCell
        let task = ModelController.shared.tasks[indexPath.row]

        cell?.delegate = self
        cell?.task = task
        return cell ?? UITableViewCell()
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = ModelController.shared.tasks[indexPath.row]
            ModelController.shared.remove(task: task)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let destinationVC = segue.destination as? DetailedTaskTableViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let task = ModelController.shared.tasks[indexPath.row]
            destinationVC?.task = task
        }
    }
 

}
