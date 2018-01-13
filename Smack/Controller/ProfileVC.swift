//
//  ProfileVCViewController.swift
//  Smack
//
//  Created by LinuxPlus on 1/12/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    // Outlets
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
     
    }


    @IBAction func closedModalPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LogoutPressed(_ sender: UIButton) {
        UserDataService.instance.logoutUser()
        //notif of log out
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
 
    func setUpView()    {
        userName = UserDataService.instance.name
        userEmail = UserDataService.instance.email
        userImg.image = UIImage(named: UserDataService.instance.avatarName)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
    
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer)   {
        dismiss(animated: true, completion: nil)
    }
    
    
}
