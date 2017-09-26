//
//  ViewController.swift
//  TipPro
//
//  Created by Matthew Harrilal on 7/5/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var billAmountField: UITextField!
    @IBOutlet var tipSelector: UISegmentedControl!
    @IBOutlet var tipAmountField: UITextField!
    @IBOutlet var totalAmountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: UIButton) {
        
        if let billAmount = Double(billAmountField.text!)
        {
            //Double
            var tipPercentage = 0.0
            
            switch tipSelector.selectedSegmentIndex {
            case 0:
                tipPercentage = 0.15
            case 1:
                tipPercentage = 0.18
            case 2:
                tipPercentage = 0.20
            default:
                break
            }
            
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100 * tipAmount)/100
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            if (!billAmountField.isEditing)
            {
                billAmountField.text = String(format:"%.2f",roundedBillAmount)
            }
            
            tipAmountField.text = String(format:"%.2f",tipAmount)
            totalAmountField.text = String(format:"%.2f", totalAmount)
            
        }
        else
        {
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
        }
    }
    
    //Hiding status bar
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }


}

