//
//  newTipViewController.swift
//  tips
//
//  Created by ZengJintao on 12/7/15.
//  Copyright © 2015 ZengJintao. All rights reserved.
//

import UIKit

extension Double {
    var asLocaleCurrency:String {
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(self)!
    }
}

class TipViewController: UIViewController {
    
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipsLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var totalLabelBy2: UILabel!
    
    @IBOutlet weak var totalLabelBy3: UILabel!
    
    @IBOutlet weak var totalLabelBy4: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var resultView: UIView!
    
    @IBOutlet weak var resultToBillField: NSLayoutConstraint!
    
    @IBOutlet weak var billFieldToTop: NSLayoutConstraint!
    
    
    
    let tipPercentages = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipsLabel.text = 0.0.asLocaleCurrency
        totalLabel.text = 0.0.asLocaleCurrency
        totalLabelBy2.text = 0.0.asLocaleCurrency
        totalLabelBy3.text = 0.0.asLocaleCurrency
        totalLabelBy4.text = 0.0.asLocaleCurrency
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaults.objectForKey("default_tipPercentage_Index")
        if index == nil {
            print("nil")
            tipControl.selectedSegmentIndex = 0
        } else {
            tipControl.selectedSegmentIndex = index as! Int
        }
        
        resultView.alpha = 0
        //        resultView.center = CGPoint(x: self.resultView.center.x, y: CGFloat(550))
        resultView.hidden = true
        
        tipControl.alpha = 0
        tipControl.hidden = true
        
        resultToBillField.constant = 100
        billFieldToTop.constant = 100
        
        billField.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        print(tipPercentage)
        changeTipsAndTotalLabel(tipPercentage)
        if billField.text != "" {
            
            self.resultToBillField.constant = 10
            self.billFieldToTop.constant = 8
            self.resultView.hidden = false
            self.tipControl.hidden = false
            UIView.animateWithDuration(0.4, delay: 0, options: .CurveEaseIn, animations: { () -> Void in
                
                self.view.layoutIfNeeded()
                self.resultView.alpha = 1
                self.tipControl.alpha = 1
                
                }, completion: nil)
            
        } else {
            self.resultToBillField.constant = 100
            self.billFieldToTop.constant = 100
            UIView.animateWithDuration(0.4, delay: 0, options: .CurveEaseIn, animations: { () -> Void in
                self.resultView.alpha = 0
                self.tipControl.alpha = 0
                self.view.layoutIfNeeded()
                
                
                
                }, completion: { (Bool) -> Void in
                    self.resultView.hidden = true
                    self.tipControl.hidden = true
            })
            
            
        }
        
    }

    
    func changeTipsAndTotalLabel(percentage:Double) {
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * percentage
        let total = billAmount + tip
        //        tipsLabel.text = String(format: "$%.2f", tip)
        //        totalLabel.text = String(format: "$%.2f", total)
        tipsLabel.text = tip.asLocaleCurrency
        totalLabel.text = total.asLocaleCurrency
        totalLabelBy2.text = (total/2).asLocaleCurrency
        totalLabelBy3.text = (total/3).asLocaleCurrency
        totalLabelBy4.text = (total/4).asLocaleCurrency
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            print("doneeee")
            let setController = segue.sourceViewController as! SettingViewController
            if let newpercentage = setController.defaultTipsIndex {
                changeTipsAndTotalLabel(tipPercentages[newpercentage])
                tipControl.selectedSegmentIndex = setController.tipControl.selectedSegmentIndex
            }
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
