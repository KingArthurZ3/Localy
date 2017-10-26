//
//  ViewController.swift
//  Scoopify
//
//  Created by Arthur Zhang on 10/24/17.
//  Copyright © 2017 Scoopify. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Google
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate{

    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBAction func signInBtn(_ sender: Any) {
        if Auth.auth().currentUser != nil{
            self.performSegue(withIdentifier: "goToFeed", sender: self)
        } else{
            print("user not logged in")
        }
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        signOut()
    }
    
    
    
    func signOut(){
        if Auth.auth().currentUser != nil{
            //there is user signed in
            do{
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "goToLogin", sender: self)
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
         
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupGoogleButtons()
    }
    
    fileprivate func setupGoogleButtons() {
        //add google sign in button
        let signBtn = signInButton
        signBtn?.frame = CGRect(x: 16, y: 116 + 66, width: view.frame.width - 32, height: 50)
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
//    //handles sign in if using a custom sign in button
//    func handleCustomGoogleSign(){
//        GIDSignIn.sharedInstance().signIn()
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

