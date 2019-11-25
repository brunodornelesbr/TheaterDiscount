//
//  Client.swift
//  TheaterDiscounts
//
//  Created by Bruno Dorneles on 25/11/19.
//  Copyright © 2019 Bruno Dorneles. All rights reserved.
//

import UIKit

protocol Client {
    func pricePerTicket()->Double
    func name()->String
}
