//
//  ViewController.swift
//  RadioButton
//
//  Created by Архип on 4/16/17.
//  Copyright © 2017 ArkhypKoshel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AKRadioButtonsControllerDelegate {
    var radioButtonsController: AKRadioButtonsController!
    @IBOutlet var radioButtons: [AKRadioButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.radioButtonsController = AKRadioButtonsController(radioButtons: self.radioButtons)
        self.radioButtonsController.delegate = self
        
        
            }
    
    
    
    func selectedButton(sender: AKRadioButton){
        let alert = UIAlertController(title: "Alert!", message: "selected Button: \(sender.title(for: .normal)!)", preferredStyle: UIAlertControllerStyle.alert)
        let dismissAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) -> Void in
        }
        
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func selectedIndex(_ sender: Any) {
        let alert = UIAlertController(title: "Alert!", message: "selected index: \(radioButtonsController.selectedIndex + 1)", preferredStyle: UIAlertControllerStyle.alert)
        
        let dismissAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) -> Void in
        }
        
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

