//
//  paymentInfo.swift
//  Tip Calculator
//
//  Created by Lambros Tzanetos on 24/10/17.
//  Copyright © 2017 Mogul Asterovska. All rights reserved.
//

import Foundation


class paymentInfo: NSObject {
    var totalAmount: String
    var individualAmount: String
    var amountPaid: String
    var changeReceived: String
    
    init(totalAmount: String, individualAmount: String, amountPaid: String, changeReceived: String) {
        self.totalAmount = totalAmount
        self.individualAmount = individualAmount
        self.amountPaid = amountPaid
        self.changeReceived = changeReceived
    }
    
    
}
