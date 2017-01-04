//
//  VaultViewController.swift
//  Keeper
//
//  Created by sakuke on 1/4/17.
//  Copyright © 2017 Quang. All rights reserved.
//

import UIKit

class VaultViewController: UIViewController {
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenu.target = self.revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
    
    }
    
   
}
