//
//  ViewController.swift
//  PickerAlert
//
//  Created by Siyun Min on 2020/07/06.
//  Copyright © 2020 Siyun Min. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 10.0
    
    var isGotIt = false
    
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var selectedTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        
        currentTime.text = formatter.string(from: date as Date)
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func selectTime(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        
        selectedTime.text = formatter.string(from: datePickerView.date)
        
        if(selectedTime.text == currentTime.text && !isGotIt) {
            let alertTime = UIAlertController(title: "Alert!", message: "Time is set up", preferredStyle: UIAlertController.Style.alert)
            
            let btnGotIt = UIAlertAction(title: "Yes, I got it", style: UIAlertAction.Style.default, handler: {
                ACTION in self.isGotIt = true
            })
            
            alertTime.addAction(btnGotIt)
            present(alertTime, animated: true, completion: nil)
        }
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        
        currentTime.text = formatter.string(from: date as Date)
        
        if(isGotIt) {
            isGotIt = false
        }
    }
    
}

