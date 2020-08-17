//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Lee-Roy Nadjar on 03/08/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingLabel: UILabel!
    
    var resultatCalcul = "0.0"
    var pourboire : Double = 1.0
    var person: Int = 1
    
    override func viewDidLoad() {
        updateUi()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func updateUi () {
        totalLabel.text = resultatCalcul
        settingLabel.text = "Split between \(person) people, with \(Int(pourboire * 100))% tip. "
    }
}
