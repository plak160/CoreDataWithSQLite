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
        
        labelResult.numberOfLines = 0
        labelResult.text = allResultsString
    }


}

