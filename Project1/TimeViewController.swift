//
//  TimeViewController.swift
//  Project1
//
//  Created by SWU Mac on 2020/05/02.
//  Copyright © 2020 SJ. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return labelArray[row]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return labelArray.count
    }

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var timer: UILabel!
    
    @IBOutlet var playStop: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var memoTextField: UITextView!
    
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var recordButton: UIButton!
    
    let labelArray: Array<String> = ["Study", "Work", "Exercise", "Read", "Relax"]
    var started: Bool!
    var mainTimer: Timer?
    var timeCount = 0
    
    @IBAction func playStopButton(_ sender: UIButton) {
        if started {
            started = false
            self.activityIndicator.stopAnimating()
            sender.setTitle("Play", for: .normal)
            recordButton.isEnabled = true
            
            mainTimer?.invalidate()
            mainTimer = nil
        } else {
            started = true
            self.activityIndicator.startAnimating()
            sender.setTitle("Stop", for: .normal)
            recordButton.isEnabled = false
            
            mainTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in self.timeCount += 1
                DispatchQueue.main.async {
                    let timeString = self.makeTimeLabel(count: self.timeCount)
                    self.timer.text = timeString
                }
            })
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        started = false
        self.activityIndicator.stopAnimating()
        playStop.setTitle("Play", for: .normal)
        recordButton.isEnabled = true
        
        mainTimer?.invalidate()
        mainTimer = nil
        timeCount = 0
        timer.text = "00 : 00 : 00"
    }
    
    func makeTimeLabel(count: Int) -> (String) {
        let sec = count % 60
        let min = (count / 60) % 60
        let hour = count / 3600
        
        let sec_string = "\(sec)".count == 1 ? "0\(sec)" : "\(sec)"
        let min_string = "\(min)".count == 1 ? "0\(min)" : "\(min)"
        let hour_string = "\(hour)".count == 1 ? "0\(hour)" : "\(hour)"
        
        return ("\(hour_string) : \(min_string) : \(sec_string)")
    }
    
    var date: String?
    var name: String?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let destVC = segue.destination as! ResultViewController
            
            let formatter = DateFormatter() // 특정 포맷으로 날짜를 보여주기 위한 변수 선언
                 formatter.dateFormat = "yyyy. MM. dd" // 날짜 포맷 지정
                 date = formatter.string(from: datePicker.date)
            
            destVC.dateInfo = date
            destVC.timeInfo = timer.text!
            destVC.titleInfo = titleTextField.text!
            destVC.memoInfo = memoTextField.text!
            
            destVC.nameInfo = name
            
            let label: String = labelArray[self.pickerView.selectedRow(inComponent: 0)]
            
            destVC.labelInfo = label
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        started = false
        recordButton.isEnabled = false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }

}
