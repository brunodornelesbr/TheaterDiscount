//
//  DiscountFinderTests.swift
//  TheaterDiscountsTests
//
//  Created by Bruno Dorneles on 25/11/19.
//  Copyright © 2019 Bruno Dorneles. All rights reserved.
//


import Quick
import Nimble
@testable import TheaterDiscounts

class DiscountFinderTest: QuickSpec {
    override func spec() {
        describe("DiscountFinder"){
            context("when it loads local discount.json to testing and its monday"){
                let discountFinder = DiscountFinder()
                let discountsList =  discountFinder.getDiscounts()["monday"] as! [[String : Double]]
                let discounts = discountsList.first
                it("should have a child value for discount when its monday"){
                 expect(discounts!["child"]).to(equal(0.10))               }
                
                
            }
            context("when it loads local discount.json to testing and its sunday"){
                let discountFinder = DiscountFinder()
                               let discountsList =  discountFinder.getDiscounts()["sunday"] as! [[String : Double]]
                               let discounts = discountsList.first
                it("should have value for student"){
                     expect(discounts!["student"]).to(equal(0.0))
                }
            }
        }
    }
}
