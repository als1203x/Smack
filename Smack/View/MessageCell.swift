//
//  MessageCellTableViewCell.swift
//  Smack
//
//  Created by LinuxPlus on 1/13/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Message)    {
        messageBodyLbl.text = message.messageBody
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
     
        //ISO 8601 -- Standard - how server returns dates and time
            //Apple Formatter does not accept milliseconds
        // 2017-07-13T21:49:25.5900Z
        
        guard var isoDate = message.timeStamp else { return }
        let end = isoDate.index(isoDate.endIndex, offsetBy: -5) // end == milliseconds
        isoDate = String(isoDate[..<end])
        print(isoDate)
        
        let isoFormatter = ISO8601DateFormatter()
        let msgDate = isoFormatter.date(from: isoDate.appending("Z"))
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm a"
        
        if let finalDate = msgDate  {
            let finalDate = newFormatter.string(from: finalDate)
            timeStamp.text = finalDate
        }
        
    }
    
    
}
