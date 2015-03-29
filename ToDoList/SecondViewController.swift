//
//  SecondViewController.swift
//  ToDoList
//
//  Created by YCS on 27/3/15.
//  Copyright (c) 2015 ycswaves. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var item: UITextField!
    
    @IBAction func addItem(sender: AnyObject) {
        toDoList.addItem(item.text)
        item.text = "" //clear text field
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.item.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        item.resignFirstResponder()
        addItem(self)
        return true
    }
}

