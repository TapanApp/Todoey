//
//  ViewController.swift
//  Todoey
//
//  Created by TAPAN  RAUT on 15/04/18.
//  Copyright © 2018 TAPAN  RAUT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    var item = [""]
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = item[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func addTdoey(_ sender: UIBarButtonItem) {
        var myTextField = UITextField()
        let alert = UIAlertController(title: "Add Todoey", message: "Add new data", preferredStyle: .alert)
        let aletAction = UIAlertAction(title: "Add her", style: .default) { (action) in
            self.item.append(myTextField.text!)
        self.myTable.reloadData()
        }
        alert.addTextField { (text) in
            text.placeholder = "add text here"
            myTextField = text
            
            
            
        }
        alert.addAction(aletAction)
        self.present(alert, animated: true, completion: nil)
    }
}

