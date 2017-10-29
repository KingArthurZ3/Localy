//
//  ShopFeedVC.swift
//  Scoopify
//
//  Created by Arthur Zhang on 10/28/17.
//  Copyright © 2017 Scoopify. All rights reserved.
//

import UIKit

class ShopFeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
        customizeNavBar()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var alertButton: UIBarButtonItem!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenus(){
        if revealViewController() != nil {
            
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            
            alertButton.target = revealViewController()
            alertButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    
    func customizeNavBar(){
        navigationController?.navigationBar.tintColor = UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 255/255,green: 87/255,blue: 35/255,alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }

}
