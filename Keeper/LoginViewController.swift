//
//  LogoutViewController.swift
//  Keeper
//
//  Created by sakuke on 12/27/16.
//  Copyright © 2016 Sakuke. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var enterPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func login(_ sender: UIButton) {
    }
    @IBAction func addNewEmail(_ sender: Any) {
    }
    @IBAction func touchIDPressed(_ sender: Any) {
        
        let authenticationContext = LAContext()
        var error: NSError?
        
        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Only human allowed", reply: { (success, error) in
                if success {
                    self.nagivateToMainBar()
                }
                else {
                    if let error = error as? NSError{
                        let message = self.errorMessageForLAErrorCode(errorCode: error.code)
                        self.showAlertAfterEvaluatingPolicyWithMessage(message: message)
                    }
                }
            })
        }
        else {
            showAlertViewForNoBiometrics()
            return
        }
    }
    
    func nagivateToMainBar () {
        
            if let window = UIApplication.shared.keyWindow {
                window.rootViewController = storyboard!.instantiateViewController(withIdentifier: "MainTabBarViewController")
        }
      
    }
    
    func showAlertAfterEvaluatingPolicyWithMessage(message: String) {
        showAlertWithTitle(title: "Error", message: message)
    }
    
    func errorMessageForLAErrorCode(errorCode: Int) -> String  {
        
        var message = ""
        switch errorCode {
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attempts"
        case LAError.touchIDNotAvailable.rawValue:
            message = "TouchID is not available on the device"
        case LAError.userCancel.rawValue:
            message = "The user did cancel"
        case LAError.userFallback.rawValue:
            message = "The user chose to use fallback"
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
        default:
            message = "Did not find error code on LAError object"
        }
        return message
    }
    @IBAction func displayNumber(_ sender: UIButton) {
    }
    
    @IBAction func displayLetter(_ sender: UIButton) {
    }
    
    func showAlertViewForNoBiometrics() {
        
        showAlertWithTitle(title: "Error", message: "This device does not have a Touch ID sensor.")
    }
    
    func showAlertWithTitle(title: String, message: String) {
        let alertVC = UIAlertController(title: title,  message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
}
