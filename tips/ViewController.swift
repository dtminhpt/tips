
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
    
    
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePeopleLabel: UILabel!
    @IBOutlet weak var fourPeopleLabel: UILabel!
    
    
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        self.view.backgroundColor = UIColor.greenColor()
        
        if let lastBillAmount = SettingsHelper.getLastBillAmount() {
            billField.text = lastBillAmount
        }
        
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
        //let tipPercentage = userDefaults.doubleForKey("tip")
        let tipIndex = userDefaults.integerForKey("ind")
        tipControl.selectedSegmentIndex = tipIndex
        
        self.onEditingChanged(self)
        
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
        
        let billAmountString = billField.text! as NSString
        SettingsHelper.setLastBillAmount(billAmountString as String)
       
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        let billAmount = billAmountString.doubleValue
        let tip = billAmount * tipPercentage
        
        let total = billAmount + tip
        
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        
        tipPercentLabel.text = "Tip (\(Int(tipPercentage*100))%)"
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
        twoPersonLabel.text = formatter.stringFromNumber(total/2)
        threePeopleLabel.text = formatter.stringFromNumber(total/3)
        fourPeopleLabel.text = formatter.stringFromNumber(total/4)
        
        fadeInTotal()
    }
    
    func fadeInTotal() {
        self.totalLabel.alpha = 0
        UIView.animateWithDuration(0.4, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                self.totalLabel.alpha = 1
            }, completion: nil )
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

