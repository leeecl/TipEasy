//
//  ViewController.swift
//  TipEasy
//
//  Created by lesleychai on 12/6/15.
//  Copyright © 2015 lichai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var settingBtn: UIBarButtonItem!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var bgImageView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
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
        // If index changed, the calculated number shown should reflect the change
        let tipPercentage = tipPercentages[index]
        let billText = (billField.text! as NSString).substringFromIndex(1)
        let billAmount = (billText as NSString).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        //Unimportant animation
        UIView.animateWithDuration(0.4,animations: {
            self.firstView.backgroundColor = UIColor.grayColor()
        })
        UIView.animateWithDuration(0.4,animations: {
            self.firstView.backgroundColor = nil
        })
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }
    
    @IBAction func onEditing(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let billText = (billField.text! as NSString).substringFromIndex(1)
        let billAmount = (billText as NSString).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        // formatting the return string to be two decimal
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
//        UIView.animateWithDuration(0.4,animations: {
//            self.firstView.backgroundColor = UIColor.grayColor()
//        })
//        UIView.animateWithDuration(0.4,animations: {
//            self.firstView.backgroundColor = nil
//        })
        
    }
    

    //keyboard gone tapping somewhere else
    @IBAction func onTap
        (sender: AnyObject) {
            view.endEditing(true)
    }
    

}

