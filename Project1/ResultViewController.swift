//
//  ResultViewController.swift
//  Project1
//
//  Created by SWU Mac on 2020/05/02.
//  Copyright © 2020 SJ. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var goodLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var memoLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    
    var nameInfo: String?
    var dateInfo: String?
    var titleInfo: String?
    var memoInfo: String?
    var timeInfo: String?
    
    var labelInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        goodLabel.text = "Good job " + nameInfo! + "!"
        
        dateLabel.text = dateInfo
        titleLabel.text = titleInfo
        memoLabel.text = memoInfo
        timeLabel.text = timeInfo
        
        categoryLabel.text = labelInfo
    }


}
