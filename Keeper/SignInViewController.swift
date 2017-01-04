//
//  ThirdViewController.swift
//  Keeper
//
//  Created by sakuke on 12/26/16.
//  Copyright © 2016 Sakuke. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    var user: User!
   
    
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        emailAddress.text = user.email
        password.text = user.password
    }
    
    @IBAction func handleUsername(_ sender: Any) {
        
     
        
        
    }
    
    @IBAction func handleSignIn(_ sender: Any) {
        
        //use firebase here
           }
}
