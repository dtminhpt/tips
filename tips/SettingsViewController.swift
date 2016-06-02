//
//  SettingsViewController.swift
//  tips
//
//  Created by Dinh Thi Minh on 6/2/16.
//  Copyright © 2016 Dinh Thi Minh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var themeControl: UISegmentedControl!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choosePercentage(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let index = tipControl.selectedSegmentIndex
        
        //To save a key:tipPercentage to NSUserDefaults
        userDefaults.setObject(tipPercentage, forKey: "tip")
        userDefaults.setInteger(index, forKey: "ind")
        userDefaults.synchronize()
    }
    
    
    @IBAction func ChooseTheme(sender: AnyObject) {
        switch(themeControl.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.whiteColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        default:
            self.view.backgroundColor = UIColor.redColor()
        }
        
        //To save a key: theme to NSUserDefaults
        let index = themeControl.selectedSegmentIndex
        userDefaults.setInteger(index, forKey: "theme")
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
