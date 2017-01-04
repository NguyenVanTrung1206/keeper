//
//  MasterPasswordController.swift
//  Keeper
//
//  Created by sakuke on 12/30/16.
//  Copyright © 2016 Quang. All rights reserved.
//

import UIKit
import Firebase

class MasterPasswordViewController: UIViewController {
    
    var user: User!
    
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var masterPassword: UITextField!
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        emailAddress.text = user.email
    }
    @IBAction func handleMasterPassword(_ sender: UIButton) {
        
        user.password = masterPassword.text
        
        if user.emptyPassword() == true {
            
            let alertController = UIAlertController(title: "Hello  Friends", message: "Please enter your password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            performSegue(withIdentifier: "ToMainBar", sender: user)
        }
        
    }
    
    @IBAction func handleSignup(_ sender: Any) {
        
        guard let email = emailAddress.text, let password = masterPassword.text else {
            print("Form is not change")
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
            
            if error != nil {
                print(error as Any)
                return
            }
            guard let uid = user?.uid else {
                return
            }
            //successfully authenticated user
            let ref = FIRDatabase.database().reference()
            let userReference = ref.child("users").child(uid)
            let values = ["email": email]
         /*  userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if err != nil {
                    print(err!)
                    return
                }
                print("Save user successfully")
            })
        */
        })
    }
    
}
