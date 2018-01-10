//
//  AvatarCell.swift
//  Smack
//
//  Created by LinuxPlus on 1/10/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }

    func setUpView()    {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
            // no view spill
        self.clipsToBounds = true
    }
    
    
}
