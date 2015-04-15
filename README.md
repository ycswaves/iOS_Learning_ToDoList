Udemy iOS programming using swift:
To-Do List app

## Takeaways

### Use of tableview:

- Return number of rows
```
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

- Get row content
```
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
    cell?.textLabel?.text = toDoList.getItem(indexPath.row)
    return cell!
}
```
  - Set Prototype Cells to 1 for setting Identifier for tableView later
  - The *reuseIdentifier* ("Cell") is set on Main.storyboard => Table View Cell => "Identifier"

- Tableview action
```
func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == UITableViewCellEditingStyle.Delete { //swipe left
        toDoList.removeItem(indexPath.row)
        todoListTable.reloadData()
    }
}
```
  - UITableViewCellEditingStyle.ACTION to check gesture (e.g. Delete is actually a "swipe left" gesture)

- Tableview reload
```
@IBOutlet weak var todoListTable: UITableView!
todoListTable.reloadData() //to reflect the lastest changes of data
```

### Use of UITextFieldDelegate
in viewDidLoad(), set UITextField's delegate to the controller itself
```
self.item.delegate = self //@IBOutlet weak var item: UITextField!
```

- Tap away or tap "return" on keyboard to hide the keyboard
```
override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    self.view.endEditing(true)
}

func textFieldShouldReturn(textField: UITextField!) -> Bool {
    item.resignFirstResponder()
    addItem(self) // add function call if return means submission of the entered content
    return true
}
```

- Permanent storage
```
NSUserDefaults.standardUserDefaults().objectForKey(storeKey) //get
NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: storeKey) //set
```
