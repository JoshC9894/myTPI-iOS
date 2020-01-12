//
//  JCSettingsVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 26/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class JCSettingsVC: UIViewController, PFSignUpViewControllerDelegate, PFLogInViewControllerDelegate {
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func backTapped(_ sender: AnyObject) {
        dismissVC()
    }
    
    
    @IBAction func loginTapped(_ sender: AnyObject) {
        if (PFUser.current()==nil){
            let logInViewController = PFLogInViewController()
            
            logInViewController.delegate = self
            
            let signUpViewController = PFSignUpViewController()
            
            signUpViewController.delegate = self
            
            logInViewController.signUpController = signUpViewController
            
            self.present(logInViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func signoutTapped(_ sender: AnyObject) {
        PFUser.logOut()
    }
    
    
    
    
    
    func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    func log(_ logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        if (!username.isEmpty || !password.isEmpty){
            return true
        } else {
            return false
        }
    }
    
    func log(_ logInController: PFLogInViewController, didLogIn user: PFUser) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func log(_ logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        
    }
    
    func signUpViewController(_ signUpController: PFSignUpViewController, shouldBeginSignUp info: [AnyHashable: Any]) -> Bool {
        if let password = info["password"] as? String{
            return password.utf16.count >= 8
            
        } else {
            return false
        }
        
    }
    func signUpViewController(_ signUpController: PFSignUpViewController, didSignUp user: PFUser) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func signUpViewController(_ signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        print("Failed to signup")
    }
    
    func signUpViewControllerDidCancelSignUp(_ signUpController: PFSignUpViewController) {
        print("Signup Dismissed")
    }

}
