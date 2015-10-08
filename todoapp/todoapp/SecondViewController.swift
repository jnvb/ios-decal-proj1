//
//  SecondViewController.swift
//  todoapp
//
//  Created by jnvb on 2015. 10. 2..
//  Copyright © 2015년 jnvb. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableTask: UITableView!
    var deleteTaskIndexPath: NSIndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        for(var i = 0; i < data.datas.count; i++)
        {
            if(data.datas[i].done)
            {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
                let date = dateFormatter.dateFromString(data.datas[i].when)
                if(NSDate().timeIntervalSince1970 - (date?.timeIntervalSince1970)! >= 86400)
                {
                    data.datas.removeAtIndex(i)
                }
            }
        }
        tableTask.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.datas.count
    }
    
    func cancelDeleteTask(alertAction: UIAlertAction!)
    {
        deleteTaskIndexPath = nil
    }
    
    func handleDeleteTask(alertAction: UIAlertAction!) -> Void
    {
        if let indexPath = deleteTaskIndexPath {
            tableTask.beginUpdates()
            
            data.datas.removeAtIndex(indexPath.row)
            
            // Note that indexPath is wrapped in an array:  [indexPath]
            tableTask.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            deleteTaskIndexPath = nil
            
            tableTask.endUpdates()
        }
    }
    
    
    func confirmDelete(task: String)
    {
        let alert = UIAlertController(title: "Delete Task", message: "Are you sure you want to permanently delete \(task)?", preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDeleteTask)
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelDeleteTask)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            deleteTaskIndexPath = indexPath
            let taskToDelete = data.datas[indexPath.row].task
            confirmDelete(taskToDelete)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let entry = data.datas[indexPath.row]
        if(entry.done)
        {
            entry.when = ""
        }
        else
        {
            let todaysDate:NSDate = NSDate()
            let dateFormatter:NSDateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
            let DateInFormat:String = dateFormatter.stringFromDate(todaysDate)
            
            entry.when = DateInFormat
        }
        entry.done = !entry.done
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "BasicCell")
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell") as UITableViewCell!
        let entry = data.datas[indexPath.row]
        
        //print(entry.task)
        //print(entry.when)
        
        if(entry.done)
        {
            cell.backgroundColor = UIColor .greenColor()
        }
        else
        {
            cell.backgroundColor = UIColor .whiteColor()
        }
        
        cell.textLabel?.text = entry.task
        cell.detailTextLabel?.text = entry.when
        
        return cell
    }
}


