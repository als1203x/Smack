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
    var socket =  SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress]).defaultSocket
    
    
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
    
        //Listener for Messages
    func getChatMessage(completion: @escaping (_ newMessage: Message ) -> Void)    {
        socket.on("messageCreated") {   (dataArray, ack) in
                //if MessageService.instance.selectedChannel ==
            guard let messageBody = dataArray[0] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            guard let userName = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvatarColor = dataArray[5] as? String else { return }
            guard let id = dataArray[6] as? String else { return }
            guard let timeStamp = dataArray[7] as? String else { return }
            let newMessage = Message(messageBody: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
            completion(newMessage)
        }
    }
    
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String:String]) -> Void)    {
        socket.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String: String] else { return }
            completionHandler(typingUsers)
        }
        
    }
    
    
    
    
}