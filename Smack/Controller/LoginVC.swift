//
//  LoginVC.swift
//  Smack
//
//  Created by LinuxPlus on 1/9/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    

    @IBAction func closePressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
   
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
    
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
        
    }
}
