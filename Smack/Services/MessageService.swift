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

    func findAllChannel(completion: @escaping CompletionHandler)    {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                do{
                    if let json = try JSON(data: data).array    {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        
                        let channel = Channel(channelTitle: name, ChannelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    completion(true)
                    }
                }catch {
                        debugPrint(error)
                }
            }else{
                completion(false)
                debugPrint(response.error as Any)
            }
        }
    }
    
    
    
    
}
