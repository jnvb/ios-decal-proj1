//
//  FirstViewController.swift
//  todoapp
//
//  Created by jnvb on 2015. 10. 2..
//  Copyright © 2015년 jnvb. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet var buttonOk: UIButton!
    @IBOutlet var textInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOk.addTarget(self, action: "buttonOkPress", forControlEvents: .TouchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //print(data.datas)
    }
    
    func buttonOkPress()
    {
        //let todaysDate:NSDate = NSDate()
        //let dateFormatter:NSDateFormatter = NSDateFormatter()
        //dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        //let DateInFormat:String = dateFormatter.stringFromDate(todaysDate)
        
        data.datas.append(Data.Entry(task: textInput.text!, when: ""))
        
        textInput.text = ""
        
        tabBarController?.selectedIndex = 1
        
    }
    
    
}

