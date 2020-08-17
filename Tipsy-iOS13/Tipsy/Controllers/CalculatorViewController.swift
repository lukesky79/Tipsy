//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipAmount = 0.0
    var splitNumber = 0.0
    
    var resultatFinal = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        if sender.currentTitle! == zeroPctButton.currentTitle {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipAmount = 0.0
        } else if sender.currentTitle! == tenPctButton.currentTitle {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipAmount = 0.1
            
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipAmount = 0.2
        }
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
       
        
    }
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let doubleBill = Double(billTextField.text ?? "0.0" )
        
        
        let operation = (( doubleBill! + ( doubleBill! * tipAmount ) ) / Double(splitNumberLabel.text!)! )
        
       resultatFinal = String(format: " %.2f" ,operation )
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.resultatCalcul = resultatFinal
        destinationVC.pourboire = tipAmount
        destinationVC.person = Int(splitNumberLabel.text!)!
        
    }
    
    
    
    
}

