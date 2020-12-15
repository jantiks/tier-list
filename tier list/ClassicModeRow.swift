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
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .black
       
        //sizes for button and collectionview
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.buttonTouchedClosure?()
        rowTag = headerButton.tag
        
        
    }
    
    
    func configure() {
        collectionView.reloadData()
        
        if let rowWidth = width {
            headerButton.frame.size.width = (rowWidth / 8)
            collectionViewWidth.constant = (rowWidth * (7/8) )
        } else { return }
        
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
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 3
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if components.count < 5 {
            return CGSize(width: CGFloat((collectionViewWidth.constant / 4)), height: height! - 10)
        }
        
        return CGSize(width: CGFloat(CGFloat(collectionViewWidth.constant) / CGFloat(components.count)), height: height!)
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ac = UIAlertController(title: "Delete image?", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Yes", style: .destructive) {
            [weak self] _ in
            self?.components.remove(at: indexPath.item)
            collectionView.reloadData()
        })
        ac.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(ac, animated: true)
    }
    
}

extension ClassicModeRow: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
    

