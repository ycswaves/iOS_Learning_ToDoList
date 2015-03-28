//
//  TableObj.swift
//  ToDoList
//
//  Created by YCS on 28/3/15.
//  Copyright (c) 2015 ycswaves. All rights reserved.
//

import UIKit

class ToDoTable {
    private var toDoList = [String]()
    private let storeKey = "toDoList"
    
    init() {
        if NSUserDefaults.standardUserDefaults().objectForKey(storeKey) != nil {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey(storeKey) as [String]
        }
    }
    
    func getTotal() -> Int {
        return toDoList.count
    }
    
    func getItem(index: Int) -> String {
        return toDoList[index]
    }
    
    func addItem(item: String) {
        toDoList.append(item)
        updatePermStorage();
    }
    
    func removeItem(index: Int) {
        toDoList.removeAtIndex(index)
        updatePermStorage();
    }
    
    private func updatePermStorage() {
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: storeKey) //update permanent storage
    }
}
