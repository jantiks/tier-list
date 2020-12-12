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

