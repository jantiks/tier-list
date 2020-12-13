//
//  ClassicModeRow.swift
//  tier list
//
//  Created by Tigran on 12/12/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ClassicModeRow: UITableViewCell {
    @IBOutlet var headerButton: UIButton!
    @IBOutlet var collectionView: UICollectionView!
    var height: CGFloat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func headerTapped(_ sender: UIButton) {
        
    }
    
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
}

extension ClassicModeRow: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCell else { fatalError() }
        cell.backgroundColor  = .systemBlue
        cell.frame.size.height = height!
        cell.frame.size.width = height!
        return cell
    }
    
    
}
