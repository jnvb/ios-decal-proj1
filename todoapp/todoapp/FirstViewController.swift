//
//  FirstViewController.swift
//  todoapp
//
//  Created by jnvb on 2015. 10. 2..
//  Copyright © 2015년 jnvb. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var countLabel:UILabel!
    @IBOutlet var percentageLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewWillAppear(animated: Bool)
    {
        var cnt = 0
        for(var i = 0; i < data.datas.count; i++)
        {
            if(data.datas[i].done == true)
            {
                cnt = cnt + 1
            }
        }
        
        countLabel.text = String(cnt) + " / " + String(data.datas.count)
        percentageLabel.text = String(format: "%.0f", (Float(cnt) / Float(data.datas.count) * 100)) + "%"
    }
}

