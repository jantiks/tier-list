//
//  ClassicModeRow.swift
//  tier list
//
//  Created by Tigran on 12/12/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ClassicModeRow: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet var headerButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    var rowTag: Int?
    var height: CGFloat?
    var width: CGFloat?
    var components = [tierComponent]()
    
    var buttonTouchedClosure : (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.buttonTouchedClosure?()
        rowTag = headerButton.tag
        
        
    }
    
    
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return components.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCell else { fatalError("coudl not load collview cell") }
        
        
            let image = components[indexPath.item]
            let path = getDocumentsDirectory().appendingPathComponent(image.image)
            cell.imageView.image = UIImage(contentsOfFile: path.path)
            print(components)
            cell.backgroundColor  = .systemBlue
            cell.frame.size.height = height!
            cell.frame.size.width = (width! - 46.0) / 4
        
        
        
        
        return cell
    }
    
    
}

extension ClassicModeRow: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
    

