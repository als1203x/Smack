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
let BASE_URL = "https://smachat.herokuapp.com/"
let URL_REGISTER = "\(BASE_URL)account/register"

//Segues

let TO_LOGIN = "ToLogin"
let TO_CHATVC = "ToSW_Rear"
let TO_CHANNELVC = "ToSW_FRONT"
let TO_CREATE_ACCOUNT = "ToCreateAccount"
let UNWIND = "UnwindToChanel"


//User Default

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
