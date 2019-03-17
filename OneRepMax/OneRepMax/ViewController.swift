//
//  ViewController.swift
//  OneRepMax
//
//  Created by Mauro Garcia on 14/01/2019.
//  Copyright © 2019 Mauro Garcia. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //keep your  outlets at the top
    //no functinoal reason, this is just where everybody keeps them
    //by placing them all together at the top it makes your code easier follow
    @IBOutlet weak var weightLabel: UITextField!
    @IBOutlet weak var repLabel: UILabel!
    @IBOutlet weak var repMax: UILabel!
    @IBOutlet weak var excerciseLabel: UIButton!
    @IBOutlet weak var excerciseDataLabel: UIButton!
    
    //made a few small tweaks to Calculator
    //before you were creating it each time to computer the 1 rep max
    //changed it from a class to a struct and keeping a ereference
    //I am using it as your "model" object
    //when the UI changes data, it makes teh change to this model object
    //then when the UI beeds updated a call is made to the new func upddateUI
    let calculator = Calculator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        repMaxLabel()
    }
    
    
    //centralizing all UI updates to a single func
    //this will make your code much simplier and easier to read and debug
    //the concept is to keep all your data in model objects
    //then have a single func that updates the entire UI based on the current
    //state of the UI
    func updateUI() {
        weightLabel.text = String(format: "%1.1f", calculator.weight)
        repLabel.text = "\(calculator.reps)"
        repMax.text = "1RM: \(String(format: "%1.1f", calculator.oneRepMax))kg"
    }
    
    
    
    @IBAction func excerciseChooserButton(_ sender: UIButton) {
    }
    
    
    // Decrease and increase weight by 5
    
    @IBAction func plusWeight(_ sender: UIButton) {
        calculator.weight += 5
        updateUI()
    }
    
    
    
    @IBAction func minusWeight(_ sender: UIButton) {
        calculator.weight -= 5
        updateUI()
    }
    
    
    
    @IBAction func repSlider(_ sender: UISlider) {
        calculator.reps = Int(sender.value)
        updateUI()
    }
    
    
    
    // func to update main excercise text
    
    
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

