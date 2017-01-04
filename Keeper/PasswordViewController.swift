//
//  SecondViewController.swift
//  Keeper
//
//  Created by sakuke on 12/26/16.
//  Copyright © 2016 Sakuke. All rights reserved.
//

import UIKit


class PasswordViewController: UIViewController {
    
    var user: User!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailAddress.text = user.email
    }
    
    @IBAction func handlePassword(_ sender: Any) {
        
        user.password = password.text
<<<<<<< HEAD
        
=======
        user.email = emailAddress.text
>>>>>>> f8adce87445219d4e7aae4b51e81077be3a4f60b
        if user.emptyPassword() == true {
            
            let alertController = UIAlertController(title: "Hello  Friends", message: "Please enter your password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            performSegue(withIdentifier: "ToSignInForm", sender: user)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToSignInForm" {
            
            if let signInViewController = segue.destination as? SignInViewController {
                if let user = sender as? User {
                    
                    signInViewController.user = user
                   
                }
            }
        }
        
    }

}

