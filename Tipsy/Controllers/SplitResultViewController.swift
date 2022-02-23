//
//  SplitResultViewController.swift
//  Tipsy
//
//  Created by Paulina Vara on 14/08/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class SplitResultViewController: UIViewController {
    var bill = Bill(billTotal: nil, tipPercentage: nil, totalPeople: nil)
    var splitBill: Float? = nil
    var summary: String? = nil
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(splitBill ?? 0.0)
        
        if let safePeople = bill.totalPeople, let safePercentage = bill.tipPercentage {
            let stringPercentage = String(format: "%.0f", safePercentage * 100)
            summary = "Split between \(safePeople) people, with \(stringPercentage)% tip"
        }
        
        summaryLabel.text = summary ?? "There's been an error"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
