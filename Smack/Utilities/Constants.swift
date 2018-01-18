//
//  Constants.swift
//  Smack
//
//  Created by LinuxPlus on 1/9/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import Foundation

//Completion Handler
typealias CompletionHandler = (_ Success: Bool) -> ()


//URL Constants
let BASE_URL = "https://smachat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel/"


//Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.3266413212, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)

//Notification Constants
    //name of notif, each name is similar to a specfic radio channel
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChnaged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channelSelected")


//Segues

let TO_LOGIN = "ToLogin"
let TO_CHATVC = "ToSW_Rear"
let TO_CHANNELVC = "ToSW_Front"
let TO_CREATE_ACCOUNT = "ToCreateAccount"
let UNWIND = "UnwindToChannel"
let TO_AVATAR_PICKER = "ToAvatarPicker"

//User Default

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"



//headers

    //header -- attachment of type of content
let HEADER = ["Content-Type": "application/json; charset=utf-8"]

let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]

