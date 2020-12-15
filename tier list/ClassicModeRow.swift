//
//  ClassicModeRow.swift
//  tier list
//
//  Created by Tigran on 12/12/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ClassicModeRow: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var headerButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewWidth: NSLayoutConstraint!
    
    var rowTag: Int?
    var height: CGFloat?
    var width: CGFloat?
    var components = [tierComponent]()
    var buttonTouchedClosure : (()->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        headerButton.frame.size.width = self.frame.size.width / 8
        collectionViewWidth.constant = (self.frame.size.width * (7/8))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

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
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if components.count < 5 {
            return CGSize(width: CGFloat((collectionViewWidth.constant / 4) - 10), height: height! - 20)
        }
        
        return CGSize(width: CGFloat(CGFloat(collectionViewWidth.constant) / CGFloat(components.count) - 10  ), height: height! - 20)
    }
    
    
}

extension ClassicModeRow: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
    

