//
//  WeekDay.swift
//  TheaterDiscounts
//
//  Created by Bruno Dorneles on 25/11/19.
//  Copyright © 2019 Bruno Dorneles. All rights reserved.
//

import UIKit

enum Weekday : Int {
    typealias RawValue = Int
    
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
    
    var name: String {
        get { return String(describing: self) }
    }
}
