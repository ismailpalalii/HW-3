//
//  ViewController.swift
//  CalenderApp
//
//  Created by ismail palali on 30.12.2021.
//

import UIKit
import Lottie

// Mark: Created Date Extension
extension Date {
    func day(format: String = "dd", self: Self) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func month(format: String = "MM", self: Self) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func year(format: String = "yyyy", self: Self) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func dateAsPrettyString(format: String = "dd<>MM<>yyyy", self: Self) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

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
        let dateFormatter = Date()
        let day = dateFormatter.day( self: datePicker.date)
        let month = dateFormatter.month( self: datePicker.date)
        let year = dateFormatter.year( self: datePicker.date)
        let prettyString = dateFormatter.dateAsPrettyString( self: datePicker.date)
        
        // Mark: Date  Added Label
        dateValue.text = "Day: \(day)"
        monthValue.text = "Month: \(month)"
        yearValue.text = "Year: \(year)"
        specialDate.text = "Pretty String: \(prettyString)"
        
    }
    
    // Mark: Animation Add
    func animationPlay(){
        calenderAnimation.contentMode = .scaleAspectFill
        calenderAnimation.loopMode = .loop
        calenderAnimation.animationSpeed = 0.5
        calenderAnimation.play()
    }
}

