//
//  HistoryTableViewController.swift
//  Tip Calculator
//
//  Created by Lambros Tzanetos on 24/10/17.
//  Copyright © 2017 Mogul Asterovska. All rights reserved.
//

import UIKit

class HistoryTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var cellCount = 0
    var existingArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if var existingArray2 = (UserDefaults.standard.object(forKey: "payments") as? Array<String>) {
            cellCount = existingArray2.count
            existingArray = existingArray2
        }
        
    }
    
    @IBAction func clearHistory(_ sender: AnyObject) {
        if var existingArray = UserDefaults.standard.object(forKey: "payments") as? Array<String> {
            existingArray = [String]()
            UserDefaults.standard.set(existingArray, forKey: "payments")
        }
        cellCount = 0
        tableView.reloadData()
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //sets number of rows per sections
        return existingArray.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //defines each cell
        
        let cellReady = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cellReady.textLabel?.numberOfLines = 2
        
        cellReady.textLabel?.text = existingArray[existingArray.count - 1 - indexPath.row]
        
        
        return cellReady
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            existingArray.remove(at: indexPath.row)
            
            tableView.reloadData()
            
            UserDefaults.standard.set(existingArray, forKey: "payments")
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
