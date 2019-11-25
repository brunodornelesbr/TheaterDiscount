//
//  DiscountManager.swift
//  TheaterDiscounts
//
//  Created by Bruno Dorneles on 25/11/19.
//  Copyright © 2019 Bruno Dorneles. All rights reserved.
//

import UIKit

protocol DiscountManagerProtocol {
    func calculateDiscountTo(client: Client)->Double
}


class DiscountManager : DiscountManagerProtocol {
    var discountFinder : DiscountFinderProtocol
    var currentDate : Date
    
   
    init(currentDate : Date,discountFinder : DiscountFinderProtocol) {
        self.currentDate = currentDate
        self.discountFinder = discountFinder
    }
    
    func calculateDiscountTo(client: Client)->Double {
           let calendarComponentWeekDay = Calendar.current.dateComponents([.weekday], from: currentDate).weekday ?? -1
           
           let weekDay = Weekday.init(rawValue: calendarComponentWeekDay)
           
           let discount = discountFinder.getDiscounts()[weekDay!.name] as! [[String : Double]]
           

           guard let discountValue = discount.first?[client.name()] else {
               return client.pricePerTicket()
           }
          
           if let student = client as? Student {
            return checkIfShouldGiveEspecialDiscountToStudent(discountValue: discountValue, student: student, weekDay: weekDay!)
           }
           
           return applyDiscount(value: client.pricePerTicket(), discountValue: discountValue)
           
          
       }
    
    
    private func applyDiscount(value : Double, discountValue : Double)->Double{
        let discount = value * discountValue
        return value - discount
    }
    
    private func checkIfShouldGiveEspecialDiscountToStudent(discountValue : Double,student : Student,weekDay: Weekday)->Double{
        if student.hasCard && weekDay != Weekday.saturday && weekDay != Weekday.sunday {
            return applyDiscount(value: student.pricePerTicket(), discountValue: 0.35)
        } else {
            return applyDiscount(value: student.pricePerTicket(), discountValue: discountValue)
        }
    }
}
