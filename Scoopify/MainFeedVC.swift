//
//  MainFeedVC.swift
//  Scoopify
//
//  Created by Arthur Zhang on 10/26/17.
//  Copyright © 2017 Scoopify. All rights reserved.
//

import UIKit
import FirebaseAuth
import Google
import GoogleSignIn


class MainFeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutBtnPressed(_ sender: Any) {
        signOut()
    }
    
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        if firebaseAuth.currentUser != nil {
            do {
                try firebaseAuth.signOut()
                GIDSignIn.sharedInstance().signOut()
                dismiss(animated: true, completion: nil)
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
