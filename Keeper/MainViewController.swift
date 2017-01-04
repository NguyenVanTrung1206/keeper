//
//  ViewController.swift
//  Keeper
//
//  Created by sakuke on 12/20/16.
//  Copyright © 2016 Sakuke. All rights reserved.
//

import UIKit
import Firebase
class MainViewController: UIViewController{

    var user: User!
    @IBOutlet weak var emailAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.user = User()
    }
    
    
    @IBAction func handleEmail(_ sender: Any) {
        
        user.email = emailAddress.text
        
        if user.isBlankEmail() {
            
            //do something here
            //It takes the title and the alert message and prefferred style
                let alertController = UIAlertController(title: "Hello  Friends", message: "Please enter your email", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
                alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: {
                self.emailAddress.becomeFirstResponder()
            
            })

            
            
        }
        else if user.isValidEmail(testStr: emailAddress.text!) == false {
            
                let alertController = UIAlertController(title: "Hello  Friends", message: "Your email is invalid, Please enter the right email", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: {
                self.emailAddress.becomeFirstResponder()
                self.emailAddress.text = self.user.email
            
            })
                
                
            
        }
        else {
                performSegue(withIdentifier: "ToPassword", sender: user)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToPassword" {
            
            if let passwordViewController = segue.destination as? PasswordViewController {
               if let user = sender as? User {
                    
                    passwordViewController.user = user
                    
                }
            }
        }
        
    }


}

