//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class SplitCalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var TwentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var bill = Bill(billTotal: nil, tipPercentage: nil, totalPeople: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        bill.billTotal = Float(billTextField.text ?? "0.0")
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        unselectButton(zeroPercentButton)
        unselectButton(tenPercentButton)
        unselectButton(TwentyPercentButton)
        sender.isSelected = true
        bill.setBillPercentage(percentageString: sender.currentTitle ?? "")
        billTextField.endEditing(true)
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        let split_num = sender.value
        splitNumberLabel.text = String(format: "%.0f", split_num)
        bill.totalPeople = Int(split_num)
        billTextField.endEditing(true)
    }
    
    func unselectButton (_ button: UIButton) {
        button.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if(segue.identifier == "goToResult"){
            let resultViewController = segue.destination as! SplitResultViewController
            
            resultViewController.bill = bill
            resultViewController.splitBill = bill.getSplitBill()
        }
        // Pass the selected object to the new view controller.
    }
    
}

