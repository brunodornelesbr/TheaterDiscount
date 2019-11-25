//
//  Student.swift
//  TheaterDiscounts
//
//  Created by Bruno Dorneles on 25/11/19.
//  Copyright © 2019 Bruno Dorneles. All rights reserved.
//

import UIKit

class Student : Client{
    func name() -> String {
        return "student"
    }
    
    var hasCard = false
    init(hasCard : Bool) {
        self.hasCard = hasCard
    }
    
    func pricePerTicket() -> Double {
        return 8.00
    }
}
