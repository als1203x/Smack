//
//  ChatVC.swift
//  Smack
//
//  Created by LinuxPlus on 1/8/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    
    @IBOutlet weak var channelNameLbl: UILabel!
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //buttonAction
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
            //reveal rear view upon pan or tap
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn  {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
        
            //Download Channels
        MessageService.instance.findAllChannel { (success) in
            
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn  {
            //get Channels

        }else{
            channelNameLbl.text = "Please Log In"
        }
    }
    
    @objc func channelSelected(_ notif: Notification)   {
        updateWithChannel()
    }
    
    func updateWithChannel() {
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelNameLbl.text = channelName
        getMessages()
        
    }
    
        //on Login What happens
    func onLoginGetMessages()   {
        MessageService.instance.findAllChannel { (success) in
            if success  {
                //Do stuff with channels
                //check if there are any channels
                if MessageService.instance.channels.count > 0   {
                        //
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    updateWithChannel()
                }else   {
                    self.channelNameLbl.text = "No channels yet!"
                }
            }
        }
    }
    
    func getMessages()  {
        guard let channelId = MessageService.instance.selectedChannel?.id else  { return }
        MessageService.instance.findAllMessagesForChannel(channelId: channelId) { (success) in
            //Do stuff with the messges
        }
    }
    

}
