//
//  ChannelVC.swift
//  Smack
//
//  Created by LinuxPlus on 1/8/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //size of rear view
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
            // react to specfic notif
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }

    @IBAction func loginBtnPressed(_ sender: UIButton) {
        if AuthService.instance.isLoggedIn  {
            //Show profile page
                //Inistiate VC
            let profile = ProfileVC()
                //present as modal
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }else   {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    //MARK: Method called by 
    @objc func userDataDidChange( _ notif: Notification)    {
        if AuthService.instance.isLoggedIn  {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
                //change userImage
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        }else   {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
}
