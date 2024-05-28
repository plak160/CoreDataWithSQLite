//
//  ViewController.swift
//  CoreDataWithSQLite
//
//  Created by Plak on 28/05/2024.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var allResultsString = "Result String"
    
    
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        addGroup(name: "Grupa 12K1", code: "12K1")
        
        labelResult.numberOfLines = 0
        labelResult.text = allResultsString
    }
    
    func updateMessageString(newMessage: String) {
        allResultsString.append("\n" + newMessage)
    }
    
    func addGroup(name: String, code: String){
        // 1. Create an Group object
        let newGroup = Groups(context: context)
        
        // 2. Set the properties of that object
        newGroup.name = name
        newGroup.code = code
        
        // 3. Use the context variable to save the Group to the database table
        do {
            try context.save()
            print("Group saved!")
            updateMessageString(newMessage: "\n Group \(name) with code \(code) saved!")
        } catch {
            print("Saved failed.")
            updateMessageString(newMessage: "Saved failed.")
        }
    }
    
   // /Users/plak/Library/Developer/CoreSimulator/Devices/EDDE665B-77D0-4C6E-853C-A64EA957AB72/data/Containers/Data/Application/D3BEE5CE-A251-44A8-9666-DCD7170ACA9B/Library/Application Support/
}

