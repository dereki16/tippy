//
//  SettingsViewController.swift
//  tippy
//
//  Created by Derek Iniguez on 8/27/20.
//  Copyright © 2020 Derek Iniguez. All rights reserved.
//

import UIKit

protocol FullSend {
    func sendItBack(str: String)
}

class SettingsViewController: UIViewController {
    
    var delegate:FullSend?
    var data = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UserDefaults.standard.integer(forKey: "slider")
        slider.value = Float(value)
        self.title = "Settings"
        adjustedTipLabel.text = String(Int(slider.value))

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var adjustedTipLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func tipSlider(_ sender: UISlider) {
        adjustedTipLabel.text = String(Int(slider.value))

        UserDefaults.standard.set(Int(slider.value), forKey: "slider")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.sendItBack(str: adjustedTipLabel.text!)
        navigationController?.popViewController(animated: true)
        
        print(adjustedTipLabel.text!)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
