//
//  JCWelcomeViewController.swift
//  Astron Group
//
//  Created by Joshua Colley on 21/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

//SideBarDelegate

import UIKit
import Parse
import ParseUI

class JCWelcomeViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    @IBOutlet weak var chatButton: UIButton!
    

    
    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (PFUser.current()==nil){
            let logInViewController = PFLogInViewController()
            
            logInViewController.delegate = self
            
            let signUpViewController = PFSignUpViewController()
            
            signUpViewController.delegate = self
            
            logInViewController.signUpController = signUpViewController
            
            self.present(logInViewController, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @IBAction func chatButtonPressed(_ sender: AnyObject) {
        
        if (PFUser.current() == nil) {
            let logInViewController = PFLogInViewController()
            
            logInViewController.delegate = self
            
            let signUpViewController = PFSignUpViewController()
            
            signUpViewController.delegate = self
            
            logInViewController.signUpController = signUpViewController
            
            self.present(logInViewController, animated: true, completion: nil)
            
        } else {
            
            performSegue(withIdentifier: "chatSegue", sender: UIButton())
        }
    }
    
    

    

}


