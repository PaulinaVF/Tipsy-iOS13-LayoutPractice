//
//  Bill.swift
//  Tipsy
//
//  Created by Paulina Vara on 14/08/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Bill {
    var billTotal: Float?
    var tipPercentage: Float?
    var totalPeople: Int?
    
    func getSplitBill () -> Float {
        var split: Float = 0.0
        let billPlusTip: Float = (billTotal ?? 0.0) + (tipPercentage ?? 0.0) * (billTotal ?? 0.0)
        if let safeTotal = totalPeople{
            split = billPlusTip / Float(safeTotal)
        }
        return split
    }
    
    mutating func setBillPercentage (percentageString: String){
        switch percentageString {
        case "0%":
            tipPercentage = 0.0
        case "10%":
            tipPercentage = 0.1
        case "20%":
            tipPercentage = 0.2
        default:
            tipPercentage = nil
        }
    }
}
