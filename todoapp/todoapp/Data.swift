//
//  Data.swift
//  todoapp
//
//  Created by jnvb on 2015. 10. 2..
//  Copyright © 2015년 jnvb. All rights reserved.
//

import Foundation

var data:Data = Data()

class Data
{
    class Entry
    {
        let task : String
        var when : String
        var done : Bool
        init(task: String, when: String, done: Bool = false)
        {
            self.task = task
            self.when = when
            self.done = done
        }
    }
    
    //"MM-dd-yyyy HH:mm"
    var datas = [
        Entry(task: "homework", when: "10-01-2015 12:12", done: true),
        Entry(task: "test", when: ""),
        Entry(task: "project due", when: ""),
        Entry(task: "cs61a hw due", when: "")
    ]
}