//
//  ViewController.swift
//  ChineseTraditionalColors
//
//  Created by Zhixuan Lai on 11/2/14.
//  Copyright (c) 2014 Zhixuan Lai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.粉紅()
        
//        let ret: AnyObject! = UIColor.粉紅().perf ("", withObject: nil)
//        println("ret = \(ret)");

        println(UIColor.performSelector(Selector("粉红"), onThread: nil, withObject: nil, waitUntilDone: false))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

