//
//  CreateAccountVC.swift
//  Smack
//
//  Created by LinuxPlus on 1/9/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIButton!
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closePressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }

    @IBAction func pickBGColorPressed(_ sender: Any) {
        
    }
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
    }
    @IBAction func createAccountPressed(_ sender: UIButton) {
            //guard with , is a where statement
        guard let name = usernameTxt.text, usernameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let password = passwordTxt.text, passwordTxt.text != ""  else { return }
        
        AuthService.instance.registerUser(email: email, password: password)
            { (success) in
                if success  {
                    AuthService.instance.loginUser(email: email, password: password, completion: {(success) in
                        if success  {
                            AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                                if success  {
                                    self.performSegue(withIdentifier: UNWIND, sender: nil)
                                    
                                }
                            })
                        }
                    })
                }
            }
    }
}