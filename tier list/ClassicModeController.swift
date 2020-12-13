//
//  ClassicModeController.swift
//  tier list
//
//  Created by Tigran on 12/12/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ClassicModeController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var components = [tierComponent]()
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
        cell.height = rowHeight!
        cell.width = rowWidth
        cell.buttonTouchedClosure = {
            [weak self] in
            let picker = UIImagePickerController()
            picker.delegate = self
            self?.present(picker, animated: true)
            
        }
        cell.components.append(contentsOf: components)
        cell.configure()
    
        return cell
    }
    
    // collectionview
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return components.count
//      }
//      
//      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCell else { fatalError("coudl not load collview cell") }
//        let rowWidth = tableView.frame.size.width
//        let image = components[indexPath.item]
//        let path = getDocumentsDirectory().appendingPathComponent(image.image)
//        cell.imageView.image = UIImage(contentsOfFile: path.path)
//        
//        cell.backgroundColor  = .systemBlue
//        cell.frame.size.height = rowHeight!
//        cell.frame.size.width = (rowWidth - 46.0) / 4
//        return cell
//      }
//
    
//    picking image from galery
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("passed")
        guard let image = info[.originalImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
            let component = tierComponent(image: imageName)
            components.append(component)
            print("this is \(components)")
            tableView.reloadData()


        }

        dismiss(animated: true)
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
   
//    @IBAction func headerTapped(_ sender: UIButton) {
//        let picker = UIImagePickerController()
//        present(picker, animated: true)
//    }
    

    

}
