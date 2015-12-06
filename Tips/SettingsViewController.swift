//
//  SettingsViewController.swift
//  Tips
//
//  Created by lesleychai on 12/6/15.
//  Copyright © 2015 lichai. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        // Tip control follow the default value
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipPercentages = [0.18, 0.20, 0.22]
        var index: Int
        for index = 0; index < tipPercentages.count; ++index{
            if tipPercentages[index] == defaults.doubleForKey("dftPercentage")
            {
                break
            }
            
        }
        tipControl.selectedSegmentIndex = index
    }
    
    @IBAction func onChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(tipPercentage, forKey: "dftPercentage")
        defaults.synchronize()
        
    }

}
