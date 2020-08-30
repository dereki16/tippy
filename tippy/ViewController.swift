//
//  ViewController.swift
//  tippy
//
//  Created by Derek Iniguez on 8/27/20.
//  Copyright © 2020 Derek Iniguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FullSend {
    func sendItBack(str: String) {
        tipAmount.text = str
        print(tipAmount.text!)
    }
    
    

    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        tipAmount.text = "15%"
        
        
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
//        if  {
//            print("The item is valued at: \(customTip)")
//        } else {
//            print("Not a valid number: \(tipAmount.text!)")
//        }
        
        let customTip = Double(tipAmount.text!) ?? 0
        
//          let customTip = NumberFormatter().number(from: tipAmount.text!)?.doubleValue ?? 0
        print(customTip)
        print(tipAmount.text!)

        // get the bill
        let bill = Double(billField.text!) ?? 0
        
        // calculate tip and total
        let tipPercentages = [0.15, 0.18, 0.2, customTip]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func onClickSettings(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
        vc?.data = tipAmount.text!
        vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)
        
    }
}
//
//extension SettingsViewController: FullSend {
//
//    func sendItBack(str: String) {
//
//    }
//
//
//}

