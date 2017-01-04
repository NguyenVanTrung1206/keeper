//
//  ThirdViewController.swift
//  Keeper
//
//  Created by sakuke on 12/26/16.
//  Copyright © 2016 Sakuke. All rights reserved.
//

import UIKit
import Firebase

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
        guard let email = emailAddress.text, let pass = password.text else {
            return
        }
        FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion:{
            (user: FIRUser?, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            //successfully authenticated user
            let ref = FIRDatabase.database().reference(fromURL: "https://keeperpeople.firebaseio.com/" )
            _ = ref.child("users").child(uid)
            let values = ["email": email, "password": pass]
            ref.updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if err != nil {
                    print(err)
                    return
                }
                print("save user successfully in Firebase Db")
                
            })
            
        })

    }
    

}
