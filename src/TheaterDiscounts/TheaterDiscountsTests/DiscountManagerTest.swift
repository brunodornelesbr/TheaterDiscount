//
//  TheaterDiscountsTests.swift
//  TheaterDiscountsTests
//
//  Created by Bruno Dorneles on 23/11/19.
//  Copyright © 2019 Bruno Dorneles. All rights reserved.
//

import Quick
import Nimble
@testable import TheaterDiscounts

class DiscountManagerTest: QuickSpec {

    override func spec() {
        describe("DiscountManager") {
            context("after being initialized and its monday"){
                let discountManager  : DiscountManagerProtocol =  DiscountManager(currentDate : dateCreator(dateString: "18-11-2019"), discountFinder: DiscountFinder())
                
                    it("should give 10percent discounts to any client"){
                        expect(discountManager.calculateDiscountTo(client: Student(hasCard: false))).to(equal(7.20))
                }
                
                    it("should give 35percent discount to a student with a card"){
                        expect(discountManager.calculateDiscountTo(client: Student(hasCard: true))).to(equal(5.2))
                    }
                
                it("should not give compound discount to a student with a card"){
                    expect(discountManager.calculateDiscountTo(client: Student(hasCard: true))).toNot(equal(3))
                }
            }
            context("after being initialized and its sunday"){
                let discountManager  : DiscountManagerProtocol =  DiscountManager(currentDate : dateCreator(dateString: "24-11-2019"), discountFinder: DiscountFinder())
                
                it("should not give a discount to childs"){
                    expect(discountManager.calculateDiscountTo(client: Child())).to(equal(5.50))
                }
                
                it("should give discount to elders"){
                    expect(discountManager.calculateDiscountTo(client: Elder())).to(equal(5.7))
                }
                
                it("shoud not give discount to students with a card"){
                expect(discountManager.calculateDiscountTo(client: Student(hasCard: true))).to(equal(8))
                }
            }
        }
    }
    
    
    private func dateCreator(dateString : String)->Date{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.date(from: dateString)!
    }

}


