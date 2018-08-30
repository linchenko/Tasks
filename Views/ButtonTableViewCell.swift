//
//  SwitchTableViewCell.swift
//  ToDoList
//
//  Created by Levi Linchenko on 29/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: class {
    func buttonTapped(sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {

    
    @IBOutlet weak var completedByOutlet: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var titleOutlet: UILabel!
    
    var task: Task?{
        didSet{
            updateView()
        }
    }
    
    weak var delegate: ButtonTableViewCellDelegate?
    
    
    
    func updateView(){
        guard let task = task else {return}
        titleOutlet.text = task.title
        buttonOutlet.isEnabled = task.isComplete
        completedByOutlet.text = "\(task.completeBy ?? Date())"
    }
    
    
    
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        
    }
    
    
    
    
    
}
