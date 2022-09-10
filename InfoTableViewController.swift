//
//  InfoTableViewController.swift
//  TeamApp
//
//  Created by MacBook Pro on 10.09.2022.
//


import UIKit

class InfoTableViewController: UITableViewController {
    
    private var info = Developer.getInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        info.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell index: \(indexPath.row)"
    
        return cell
    }
}
