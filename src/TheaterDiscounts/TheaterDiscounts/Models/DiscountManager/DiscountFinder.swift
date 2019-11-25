//
//  DiscountFinder.swift
//  TheaterDiscounts
//
//  Created by Bruno Dorneles on 25/11/19.
//  Copyright © 2019 Bruno Dorneles. All rights reserved.
//

import UIKit

protocol DiscountFinderProtocol {
    func getDiscounts()->[String : Any]
}

class DiscountFinder : DiscountFinderProtocol {
    func getDiscounts() -> [String : Any] {
        return discounts
    }
   private var discounts = [String : Any]()
    
    init() {
        loadDiscounts()
    }
    func loadDiscounts(){
        if let url =  Bundle.main.url(forResource: "discount", withExtension: "json") {
            if let jsonData = try? Data(contentsOf: url, options: .mappedIfSafe) {
                let json = try? (JSONSerialization.jsonObject(with: jsonData) as! [String:Any])
                discounts = json ?? [:]
            }
        }
    }
}



