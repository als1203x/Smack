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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func closePressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
}
