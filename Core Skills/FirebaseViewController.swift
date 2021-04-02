//
//  FirebaseViewController.swift
//  Core Skills
//
//  Created by Gratch on 3/11/20.
//  Copyright © 2020 Jonathan Gratch. All rights reserved.
//
//
//  Assignment Notes: Firebase manages the network connection
//  separately so it is easier to update the UI than using the
//  built-in functions.  I would suggest seeing the docs found at:
//  https://firebase.google.com/docs/firestore/query-data/get-data
//  https://firebase.google.com/docs/firestore/query-data/queries
//  The example database info can be found on the assignment page.
//  There is only four entries in the database -for example, CSCI 3313.

//Please Note that we are using the new Cloud Firestore not the Realtime Database


import UIKit
import FirebaseFirestore


class FirebaseViewController: UIViewController {
    @IBOutlet weak var deptTextField: UITextField!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var instructorLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var courseName : String = ""
    var instructor : String = ""
    var location : String = ""
    
    @IBAction func loadFirebaseData() {
        // This will split the input from the user into an array.
        let userInput = deptTextField.text!
        
        let inputArray = userInput.split { $0 == " " }
        
        // assign department information contained in the user input
        // to variables deptID
        let deptID = String(inputArray[0])
        
        // Task: assign course information contained in the user input
        // to a variable you define
        _ = String(inputArray[1])

        // Create the databsed collection corresponding to the
        // department information provided. The database named db is created in
        // the AppDelegate for you already
        let courseRef = db.collection(deptID)
        
        // Task: create a query which returns all courses with the provided course
        // information and use the get() function to retrive the results
        // hint: document contains a set of key-value pairs which are saved in an array
        // Extract field values to display when "download firebase data" is clicked

        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FirebaseViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
