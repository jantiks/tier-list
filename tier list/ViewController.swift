//
//  ViewController.swift
//  tier list
//
//  Created by Tigran on 12/12/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var createButton: UIButton!
    @IBOutlet var instructionsButton: UIButton!
    @IBOutlet var draftsButton: UIButton!
    @IBOutlet var upgradeButton: UIButton!
    @IBOutlet var contactButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton.setTitle("Create", for: .normal)
        createButton.setTitleColor(.white, for: .normal)
        
        instructionsButton.setTitle("Instrictions", for: .normal)
        instructionsButton.setTitleColor(.white, for: .normal)

        draftsButton.setTitle("Drafts", for: .normal)
        draftsButton.setTitleColor(.white, for: .normal)

        upgradeButton.setTitle("Upgrade", for: .normal)
        upgradeButton.setTitleColor(.white, for: .normal)

        contactButton.setTitle("Contact", for: .normal)
        contactButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func createTapped(_ sender: UIButton) {
        let ac = UIAlertController(title: "Tier list mode", message: "Choose tier list mode", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Classic mode", style: .default){
            [weak self] _ in
            if let vc = self?.storyboard?.instantiateViewController(identifier: "Classic") {
                self?.navigationController?.pushViewController(vc, animated: true)
            }
            
            
        })
        ac.addAction(UIAlertAction(title: "Drag and Drop mode", style: .default, handler: nil))
        present(ac, animated: true)
        
    }
    
    @IBAction func instructionsTapped(_ sender: UIButton) {
    }
    
    @IBAction func draftsTapped(_ sender: UIButton) {
    }

    
    @IBAction func upgradeTapped(_ sender: UIButton) {
    }
    
    @IBAction func contactTapped(_ sender: UIButton) {
    }
}

