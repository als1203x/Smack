//
//  SocketService.swift
//  Smack
//
//  Created by LinuxPlus on 1/13/18.
//  Copyright © 2018 ARC. All rights reserved.
//

import UIKit
import SocketIO


class SocketService: NSObject {

    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    //create Socket
    var socket =  SocketManager(socketURL: URL(string: BASE_URL)!).defaultSocket
    
        //connects to server
    func establishConnection()  {
        socket.connect()
    }
    
    func closeConnection()  {
        socket.disconnect()
    }
    
        // .emit -- when something is being sent from or to server
        // recieve information .on
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler)   {
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
 
        //ack is an acknowledgement
    func getChannel(completion: @escaping CompletionHandler)    {
        socket.on("channelCreated") { (dataArray, ack) in
                // is returned as type Any must cast
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
        
            let newChannel = Channel(channelTitle: channelName, ChannelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    //Send Message
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler)    {
        let user = UserDataService.instance
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
        //Listen for Messages
    
    
    
    
}
