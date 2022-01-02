//
//  ViewController.swift
//  CalenderApp
//
//  Created by ismail palali on 30.12.2021.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var calenderAnimation: AnimationView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateValue: UILabel!
    @IBOutlet weak var monthValue: UILabel!
    @IBOutlet weak var yearValue: UILabel!
    @IBOutlet weak var specialDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationPlay()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        // Mark: Date Format Created
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year: String = dateFormatter.string(from: self.datePicker.date)
        dateFormatter.dateFormat = "MM"
        let month: String = dateFormatter.string(from: self.datePicker.date)
        dateFormatter.dateFormat = "dd"
        let day: String = dateFormatter.string(from: self.datePicker.date)
        dateFormatter.dateFormat = "dd<>MM<>yyyy"
        let special = dateFormatter.string(from: self.datePicker.date)
        
        // Mark: Date  Added
        dateValue.text = "Day: \(day)"
        monthValue.text = "Month: \(month)"
        yearValue.text = "Year: \(year)"
        specialDate.text = "Speacial Date: \(special)"
        
    }
    
    // Mark: Animation Add
    func animationPlay(){
        calenderAnimation.contentMode = .scaleAspectFill
        calenderAnimation.loopMode = .loop
        calenderAnimation.animationSpeed = 0.5
        calenderAnimation.play()
    }
    
}

