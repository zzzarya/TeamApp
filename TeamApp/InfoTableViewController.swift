//
//  InfoTableViewController.swift
//  TeamApp
//
//  Created by MacBook Pro on 10.09.2022.
//


import UIKit

class InfoTableViewController: UITableViewController {
    
    private var infoList = Developer.getInfo()
    
   var developer: Developer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let info = infoList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = info.fullName
        content.secondaryText = info.work
        
        content.image = UIImage(named: info.name)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVc = segue.destination as? DetailsViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        let info = infoList[index.row]
        detailVc.info = info
    }
}


