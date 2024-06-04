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
        
            // addGroup(name: "Grupa 12K1", code: "12K1")
        
            //addSeveralGroups()
        
        fetchAllGroups()
            //fetchAllGroups(code: "12K2")
        
        updateFirstGroup(newCode: "12K1_New")
        
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
    func addSeveralGroups(){
        addGroup(name: "Grupa 11K1", code: "11K1")
        addGroup(name: "Grupa 11K2", code: "11K2")
        addGroup(name: "Grupa 11K3", code: "11K3")
        
        addGroup(name: "Grupa 12K2", code: "12K2")
        addGroup(name: "Grupa 12K3", code: "12K3")
        
        addGroup(name: "Grupa 13K1", code: "13K1")
        addGroup(name: "Grupa 13K2", code: "13K2")
        addGroup(name: "Grupa 13K3", code: "13K3")
    }
    
    func getGroupsFromFetchRequest(fetchRequest: NSFetchRequest<Groups>,
        extraDescription: String = " "){
        
        var textToShow = "--------------------" +
        "\nAll groups" + extraDescription + "\n--------------------"
        print(textToShow)
        updateMessageString(newMessage: textToShow)
        
        do {
            let groups = try context.fetch(fetchRequest)
            
            for group in groups {
                textToShow.append(" Name:")
                textToShow = group.name ?? ""
                textToShow.append("\n  code:")
                textToShow.append(group.code ?? "")
                textToShow.append("\n--------------------")
                print(textToShow)
                updateMessageString(newMessage: textToShow)
            }
        } catch {
            print("Failed to fetch groups")
            updateMessageString(newMessage: "Failed to fetch groups")
        }
    }
    
    func fetchAllGroups(){
        let fetchRequest: NSFetchRequest<Groups> = Groups.fetchRequest()
        
        getGroupsFromFetchRequest(fetchRequest: fetchRequest)
    }
    
    func fetchAllGroups(code: String){
        let fetchRequest: NSFetchRequest<Groups> = Groups.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "code LIKE %@", code)
        
        getGroupsFromFetchRequest(fetchRequest: fetchRequest,
            extraDescription: " code = \(code)")
    }
    
    func updateFirstGroup(newCode: String = "No Code"){
        let fetchRequest: NSFetchRequest<Groups> = Groups.fetchRequest()
        
        do{
            let groups = try context.fetch(fetchRequest)
            var groupName = ""
            
            let firstGroup = groups.first
            firstGroup?.code = newCode
            groupName = firstGroup?.name ?? ""
            
            try context.save()
            print("Group updated")
            updateMessageString(newMessage: "Group \(groupName) updated")
        }catch {
            print("Failed to update group")
            updateMessageString(newMessage: "Failed to update group")
        }
    }
    
    
}

