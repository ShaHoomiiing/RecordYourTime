//
//  ViewController.swift
//  Project1
//
//  Created by SWU Mac on 2020/05/01.
//  Copyright © 2020 SJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var hiddenView: UIView!
    @IBOutlet var startButton: UIButton!
    
    var info: String?
    @IBOutlet var helloName: UILabel!
    @IBAction func okButton(_ sender: Any) {
        info = name.text
        helloName.text = "Hello " + info! + "!"
        hiddenView.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRecord" {
            let destVC = segue.destination as! TimeViewController
            
            destVC.name = info
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        hiddenView.isHidden = true
    }


}

