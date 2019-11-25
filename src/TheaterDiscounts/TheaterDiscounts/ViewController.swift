//
//  ViewController.swift
//  TheaterDiscounts
//
//  Created by Bruno Dorneles on 23/11/19.
//  Copyright © 2019 Bruno Dorneles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var originalTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var discountManager : DiscountManagerProtocol!
    private var currentClient : Client?
    override func viewDidLoad() {
        super.viewDidLoad()
        discountManager = DiscountManager(currentDate: datePicker.date, discountFinder: DiscountFinder())
        
        // Do any additional setup after loading the view.
    }
    
    func setupScreen(){
        switch segmentControl.selectedSegmentIndex {
        case 0:
            currentClient = Child()
        case 1 :
            currentClient = Elder()
        case 2 :
            currentClient = Student(hasCard: false)
        default:
            currentClient = Student(hasCard: true)
        }
        
        originalTextField.text = "\(currentClient?.pricePerTicket() ?? 0)"
        discountTextField.text = "\(discountManager.calculateDiscountTo(client: currentClient!))"
           
    }

    @IBAction func didChooseAnotherClient(_ sender: UISegmentedControl) {
        setupScreen()
    }
    
    
    @IBAction func didChooseDate(_ sender: UIDatePicker) {
        discountManager = DiscountManager(currentDate: datePicker.date, discountFinder: DiscountFinder())
        setupScreen()
    }
    
}

