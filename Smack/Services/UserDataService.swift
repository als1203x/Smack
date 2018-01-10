//
//  File.swift
//  Smack
//
//  Created by LinuxPlus on 1/10/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import Foundation

class UserDataService   {
    
    static let instance = UserDataService()
    
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var name = ""
    public private(set) var email = ""

    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String)  {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.name = name
        self.email = name
    }

    func setAvatarName(avatarName: String)  {
        self.avatarName = avatarName
    }
    
}
