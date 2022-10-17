//
//  ViewController.swift
//  pamLabThree
//
//  Created by Artyom on 11.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func openAnotherVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        var hours: Int = Int(firstField.text ?? "0") ?? 0
        if hours > 24 {
            hours = 24
        }
        var minutes: Int = Int(secondField.text ?? "0") ?? 0
        if minutes > 60 {
            minutes = 60
        }
        var seconds: Int = Int(thirdField.text ?? "0") ?? 1
        if seconds > 60 {
            seconds = 60
        }
        var time = Double(hours * 24 + minutes * 60 + seconds)
        if time == 0 {
           time = 1
        }
        vc.timeInCommon = time
        vc.timeLeft = time
        self.present(vc, animated: true)
    }
    
}

