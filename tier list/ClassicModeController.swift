//
//  ClassicModeController.swift
//  tier list
//
//  Created by Tigran on 12/12/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ClassicModeController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var rowComponents = [tierComponent]()
    var components = [Int:[tierComponent]]()

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
        UIColor(red: 0.5, green: 0, blue: 1, alpha: 1) ]
    var rowCount = 6
    
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
        
        let rowWidth = tableView.frame.size.width
        cell.headerButton.setTitle(rowName[indexPath.row], for: .normal)
        cell.headerButton.setTitleColor(.black, for: .normal)
        cell.headerButton.backgroundColor = rowNameBg[indexPath.row]
        cell.headerButton.tag = indexPath.row

        
        cell.height = rowHeight!
        cell.width = rowWidth
        
        //clousre which calls uiImagePickerController from tableView
        cell.buttonTouchedClosure = {
            [weak self] in
            let picker = UIImagePickerController()
            picker.delegate = self
            self?.present(picker, animated: true)
        }
        
        if cell.rowTag == indexPath.row {
            if let tag = cell.rowTag {
                
                if components.keys.contains(tag) {
                    components[tag]?.append(rowComponents.last!)
                } else {
                    components[tag] = [rowComponents.last!]
                }
                cell.components.append((components[tag]?.last)!)
                cell.configure()
                cell.rowTag = nil

            }
            
        }
    
        return cell
    }
    
    

    
//    picking image from galery
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
            let component = tierComponent(image: imageName)
            rowComponents.append(component)
            print(rowComponents)
            tableView.reloadData()

        }

        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    

}
