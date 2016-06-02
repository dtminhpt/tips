
//
//  ViewController.swift
//  tips
//
//  Created by Dinh Thi Minh on 6/2/16.
//  Copyright © 2016 Dinh Thi Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        //set focus to billField
        billField.becomeFirstResponder()

        
        /* When returning to the main ViewController from the settings screen,
           it would be good to have the tip percentage reflect the new default value. 
           One way to do that is load the tip percentage from NSUserDefaults whenever the view appears.
        */
        //Load tipPercentage from userDefaults whenever the view appears.
        let tipPercentage = userDefaults.doubleForKey("tip")
        let tipIndex = userDefaults.integerForKey("ind")
        tipControl.selectedSegmentIndex = tipIndex
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        //Load theme from userDefaults whenever the view appears.
        let themeIndex = userDefaults.integerForKey("themeInd")
        
        //Set background color of Settings page follow themeIndex
        switch(themeIndex) {
            case 0:
                self.view.backgroundColor = UIColor.redColor()
            
            case 1:
                self.view.backgroundColor = UIColor.whiteColor()
            
            case 2:
                self.view.backgroundColor = UIColor.greenColor()
            
            default:
                self.view.backgroundColor = UIColor.redColor()
            
        }

        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

