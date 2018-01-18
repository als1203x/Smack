//
//  AddChannelVC.swift
//  Smack
//
//  Created by LinuxPlus on 1/13/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var chanDesc: UITextField!
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    
    @IBAction func closedModalPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createChannelPressed(_ sender: RoundedButton) {
        guard  let channelName = nameText.text, nameText.text != "" else { return }
        guard let channelDesc = chanDesc.text, chanDesc.text != "" else { return }
        SocketService.instance.addChannel(name: channelName, description: channelDesc) { (success) in
            if success  {
                self.dismiss(animated: true, completion: nil)
            }
        }
    
    }
    
    func setupView()    {
        let closeTouch = UITapGestureRecognizer( target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
            //Placeholder Text color
        nameText.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        chanDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer)   {
        dismiss(animated: true, completion: nil)
    }
}
