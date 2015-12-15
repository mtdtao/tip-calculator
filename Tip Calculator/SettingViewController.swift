//
//  ViewController.swift
//  Tip Calculator
//
//  Created by ZengJintao on 12/14/15.
//  Copyright © 2015 ZengJintao. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var defaultTipsIndex:Int!
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBAction func defaultPercentage(sender: AnyObject) {
        print("value change")
        //var tipPercentages = [0.18, 0.2, 0.22]
        //defaultTips = tipPercentages[tipControl.selectedSegmentIndex]
        defaultTipsIndex = tipControl.selectedSegmentIndex
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipsIndex, forKey: "default_tipPercentage_Index")
        defaults.synchronize()
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "DoneItem" {
//            print("done")
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaults.objectForKey("default_tipPercentage_Index")
        if index == nil {
            print("nil")
            tipControl.selectedSegmentIndex = 0
        } else {
            tipControl.selectedSegmentIndex = index as! Int
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

