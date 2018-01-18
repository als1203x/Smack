//
//  MessageService.swift
//  Smack
//
//  Created by LinuxPlus on 1/13/18.
//  Copyright © 2018 ARC. All rights reserved.
//

//Stores

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
 
    
    var channels = [Channel]()
    var messages = [Message]()
    var selectedChannel: Channel?
    var unreadChannels = [String]()
    
    func findAllChannel(completion: @escaping CompletionHandler)    {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                do  {
                    if let json = try JSON(data: data).array    {
                        for item in json {
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue
                            
                            let channel = Channel(title: name, description: channelDescription, id: id)
                            self.channels.append(channel)
                        }
                        NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                        completion(true)
                    }
                }catch  {
                    debugPrint(error)
                }
            }else   {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
 
    //Find All Messages
    func findAllMessagesForChannel(channelId: String, completion: @escaping CompletionHandler)  {
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                self.clearMessages()
                
                guard let data = response.data else { return }
                do  {
                    if let json = try JSON(data: data).array  {
                        for item in json    {
                            let messageBody = item["messageBody"].stringValue
                            let channelId = item["channelId"].stringValue
                            let id = item["_id"].stringValue
                            let userName = item["userName"].stringValue
                            let userAvatar = item["userAvatar"].stringValue
                            let userAvatarColor = item["userAvatarColor"].stringValue
                            let timeStamp = item["timeStamp"].stringValue

                            let message = Message(messageBody: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                            self.messages.append(message)
                            
                        }
                      completion(true)
                    }
                }catch  {
                    debugPrint(error)
                }
            }else   {
                 completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    //Clear Array for Channels for when user logs out
    func clearChannels()    {
        channels.removeAll()
    }
    
    //Clear Array of Messages
    func clearMessages()    {
        messages.removeAll()
    }
}
