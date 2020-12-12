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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.isScrollEnabled = false
        let screenHeight = view.frame.size.height - (navigationController?.navigationBar.frame.size.height)! - 20
        rowHeight = screenHeight / 6
        tableView.rowHeight = rowHeight ?? 0.0
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "row", for: indexPath) as? ClassicModeRow else { fatalError("Couldn't load cell") }
        cell.height = rowHeight!
        cell.configure()
        return cell
    }
    

    

}
