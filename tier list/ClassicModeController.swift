//
//  ClassicModeController.swift
//  tier list
//
//  Created by Tigran on 12/12/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ClassicModeController: UITableViewController {
    var rowHeight: CGFloat? = 0.0
    let rowName = ["S", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    let rowNameBg = [
        UIColor(red: 1, green: 0, blue: 0, alpha: 1),
        UIColor(red: 1, green: 0.4, blue: 0, alpha: 1),
        UIColor(red: 1, green: 0.5, blue: 0, alpha: 1),
        UIColor(red: 1, green: 0.8, blue: 0, alpha: 1),
        UIColor(red: 0.5, green: 1, blue: 0, alpha: 1),
        UIColor(red: 0.5, green: 1, blue: 0.4, alpha: 1),
        UIColor(red: 0.5, green: 1, blue: 0.7, alpha: 1),
        UIColor(red: 0.5, green: 0.9, blue: 1, alpha: 1),
        UIColor(red: 0.5, green: 0.7, blue: 1, alpha: 1),
        UIColor(red: 0.5, green: 0.4, blue: 1, alpha: 1),
        UIColor(red: 0.5, green: 0, blue: 1, alpha: 1)]
    let rowNameColor = [""]
    var rowCount = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.isScrollEnabled = false
        let screenHeight = view.frame.size.height - (navigationController?.navigationBar.frame.size.height)! - 20
        rowHeight = screenHeight / CGFloat(rowCount)
        tableView.rowHeight = rowHeight ?? 0.0
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "row", for: indexPath) as? ClassicModeRow else { fatalError("Couldn't load cell") }
        cell.headerButton.setTitle(rowName[indexPath.row], for: .normal)
        cell.headerButton.setTitleColor(.black, for: .normal)
        cell.headerButton.backgroundColor = rowNameBg[indexPath.row]
        cell.height = rowHeight!
        cell.configure()
        return cell
    }
   
    

    

}
