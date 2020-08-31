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
        sentBack = str
        tipAmount.text = str
        print(tipAmount.text!)
    }
        
    struct MyVariables {
        static var customTip: Double?
    }
    
    var delegate: FullSend?
    var sentBack: String?
    
    @IBOutlet weak var tipAmount: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    
    
    @IBOutlet weak var tipControl: UISegmentedControl! {
        didSet{
            self.tipControl.addTarget(self, action: #selector(indexCheck), for: .valueChanged)
        }
    }
    
    @objc func indexCheck(){
        if tipControl.selectedSegmentIndex == 3 {
            tipAmount.text = sentBack
        }
        else if tipControl.selectedSegmentIndex == 2 {
            tipAmount.text = "20"
        }
        else if tipControl.selectedSegmentIndex == 1 {
            tipAmount.text = "18"
        }
        else if tipControl.selectedSegmentIndex == 0 {
            tipAmount.text = "15"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        tipAmount.text = "15"
        
        let value = UserDefaults.standard.string(forKey: "bill")
        billField.text = value
    }
    
    override func viewDidAppear(_ animated: Bool) {
        indexCheck()
        calculate()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
       calculate()
    }
    
    func calculate(){
        MyVariables.customTip = (Double(tipAmount.text!) ?? 0) * 0.01
 
        // get the bill
        let bill = Double(billField.text!) ?? 0
        
        // calculate tip and total
        let tipPercentages = [0.15, 0.18, 0.2, MyVariables.customTip]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]!
        let total = bill + tip
        
        // update tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        UserDefaults.standard.set(String(billField.text!), forKey: "bill")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func onClickSettings(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
        vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)
        
    }
}
