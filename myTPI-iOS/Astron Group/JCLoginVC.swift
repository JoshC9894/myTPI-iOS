//
//  JCLoginVC.swift
//  Astron Group
//
//  Created by Joshua Colley on 23/10/2015.
//  Copyright © 2015 JC Enterprises. All rights reserved.
//

import UIKit
import Parse

class JCLoginVC: UIViewController {
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var loginView: UIView!

    @IBOutlet weak var email: UITextField!
    
    
    @IBAction func back(_ sender: AnyObject) {
        dismissVC()
    }
    
    @IBAction func login(_ sender: AnyObject) {
        login()
    }
    
    @IBAction func signup(_ sender: AnyObject) {
        signUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "addBG")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = loginView.bounds
        loginView.addSubview(blurEffectView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    

    func signUp(){
        let user = PFUser()
        user.username = username.text
        user.password = password.text
        user.email = email.text
       // user["StaffCode"] = staffCode.text
        
        user.signUpInBackground { (success: Bool, error:NSError?) -> Void in
            if error == nil{
                
            } else {
                
            }
        }
}
    
    func login(){
        let user = PFUser()
        user.username = username.text
        user.password = password.text
        PFUser.logInWithUsername(inBackground: username.text!, password: password.text!, block: {
            (User : PFUser?, Error:NSError?) -> Void in
            
            if Error == nil{
                DispatchQueue.main.async{
                    let Storyboard = UIStoryboard(name:"Main", bundle: nil)
                    let MainVC : UIViewController = Storyboard.instantiateViewController(withIdentifier: "chatScreen1")
                        
                    
                    self.present(MainVC, animated: true, completion: nil)

                }
            } else {
                NSLog("Incorrect Username/Password, Please Try Again.")
            }
        })
    }
    
    func dismissVC() {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    
    
    
}
