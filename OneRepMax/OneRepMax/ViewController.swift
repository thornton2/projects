//
//  ViewController.swift
//  OneRepMax
//
//  Created by Mauro Garcia on 14/01/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        weightLabel.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(changeText), name: NSNotification.Name(rawValue: "changeText"), object: nil)
        repMaxLabel()
     
    }

    

    
    
    @IBAction func excerciseChooserButton(_ sender: UIButton) {
    }
    
    var weight = 0 {
        didSet {
            weightLabel.text = "\(weight)"
        }
    }
    
// User input WEIGHT
    
    @IBOutlet weak var weightLabel: UITextField!
    
    func textField(_ weightLabel: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let isNumber = CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))
        let withDecimal = (
            string == NumberFormatter().decimalSeparator && weightLabel.text?.contains(string) == false
        )
        return isNumber || withDecimal
    }
    
// Decrease and increase weight by 5
    
    @IBAction func plusWeight(_ sender: UIButton) {
        weight += 5
    }
    
    @IBAction func minusWeight(_ sender: UIButton) {
        weight -= 5
    }
    
// User input REPS
    
    
    @IBOutlet weak var repLabel: UILabel!
    
    @IBAction func repSlider(_ sender: UISlider) {
        let currentRepValue = Int(sender.value)
        repLabel.text = "\(currentRepValue)"
        let cm = Calculator(weight: weightLabel.text!, reps: repLabel.text!)
        let result = cm.calcRM()
        repMax.text = "1RM: \(result)kg"
        
    }
    

    
    
    @IBOutlet weak var repMax: UILabel!
    
    @IBOutlet weak var excerciseLabel: UIButton!
    
    
    @IBOutlet weak var excerciseDataLabel: UIButton!
    
    
// func to update main excercise text
    
    @objc func changeText() {
    excerciseDataLabel.setTitle(excUserChose, for: .normal)
    }
    
    func repMaxLabel() {
        repMax.layer.masksToBounds = true
        repMax.layer.cornerRadius = 30
        repMax.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
    }
    
// segue to comeback to viewcontroller
    
    func unwindToViewController(segue:UIStoryboardSegue) { }
    
    
    
    // TODO: make a save log button.
    // TODO: make a popup view with creator info.
    

    
    
    
    
    
// pop up info menu
    
    @IBAction func popupInfo(_ sender: UIBarButtonItem) {
    }
    
  
    
    
}

