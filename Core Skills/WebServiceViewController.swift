//
//  WebServiceViewController.swift
//  Core Skills
//
//  Created by Gratch on 3/11/20.
//  Copyright © 2020 Jonathan Gratch. All rights reserved.
//
//
//  Assignment Notes: Similar to the accelerometer, certain
//  types of web updates are done off of the main thread.  Only
//  the main thread can update the UI.  So we have a separate 
//  button to update the UI.  Your code should populate the three
//  placeholder variables.  I would suggest looking at the information here:
//  https://developer.apple.com/swift/blog/?id=37

//  IMPORTANT: the response from this database is encoded as an array at the top-level, which
//  then includes JSON object as key-value pair

//  Other Resources:
//  Simple REST API calls with Swift, https://grokswift.com/simple-rest-with-swift/
//  If you want to use swift 4/5, https://www.youtube.com/watch?v=YY3bTxgxWss

import UIKit

struct Course: Decodable {
    let courseName: String
    let instructor: String
    let location: String
}

class WebServiceViewController: UIViewController {
    
    @IBOutlet weak var deptTextField: UITextField!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var instructorLabel: UILabel!
    
    var courseName : String = ""
    var instructor : String = ""
    var location : String = ""
    
    @IBAction func downloadData() {
        // This will split the input from the user into an array.
        let userInput = deptTextField.text!
        
        let inputArray = userInput.split { $0 == " " }
        
        // assign department information contained in the user input
        // to variables deptID
        let dept = String(inputArray[0])
        
        // Task: assign course information contained in the user input
        // to a variable you define
        _ = String(inputArray[1])

        // Task: Create the url string to access a course information in the database
        // using the provided department and course information
        

        
        // Tasks: set up the URL request using the url string from the above step
        // Create a URLSession and create the data task to handle the response from the API.
        // Extract course related vales from the response and use them to update the
        // placeholders
        

        
        
        
        
    }
    
    @IBAction func updateView(_ sender: Any) {
        // Helper function to update the screen.  No edits needed.
        courseNameLabel.text = courseName
        instructorLabel.text = instructor
        locationLabel.text = location
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WebServiceViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


