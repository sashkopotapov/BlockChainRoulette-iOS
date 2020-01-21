//
//  NetworkManager.swift
//  RouletteWheelGame
//
//  Created by Mac on 15.01.2020.
//  Copyright © 2020 OSX. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
        
    }
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    func login(name firstName: String, password pass: String, _ completion: @escaping (Bool) -> Void) {
        
        let params = ["firstName": firstName,
                    "password": pass]

        Alamofire.request("http://192.168.43.231:8080/users/validate", method: .post, parameters: params, headers: headers).responseString  { response in
            if let json = response.result.value {
               completion(true)
            }
        }
    }
    
    func searchGame(_ completion: @escaping (String?, Bool) -> Void) {
        let params: [String: Any] = [:]
        
        Alamofire.request("http://192.168.43.231:8080/games/search", method: .post, parameters: params, headers: headers).responseString  { response in
       
            if let json = response.result.value {
                UserDefaults.standard.set(json, forKey: "hash")
                completion(json, true)
            } else {
                completion(nil, false)
            }
        }
    }
    
    func makeBet(bet: Int, number: Int, _ completion: @escaping (Bool) -> Void) {
        let params = [
            "userId": UserDefaults.standard.value(forKey: "username"),
            "pass": UserDefaults.standard.value(forKey: "password"),
            "gameHash": UserDefaults.standard.value(forKey: "hash"),
            "bet": bet,
            "number":number
        ] as [String: Any]
        
        Alamofire.request("http://192.168.43.231:8080/games/makebet", method: .post, parameters: params, headers: headers).responseString  { response in
         
            if let json = response.result.value {
               completion(true)
            }
        }
    }
    
    func getResults(bet: Int, number: Int, _ completion: @escaping (Bool) -> Void) {
        let params = [
            "userId": UserDefaults.standard.value(forKey: "username"),
            "pass": UserDefaults.standard.value(forKey: "password"),
            "gameHash": UserDefaults.standard.value(forKey: "hash"),
            "bet": bet,
            "number":number
        ] as [String: Any]
        
        Alamofire.request("http://192.168.43.231:8080/games/roll", method: .post, parameters: params, headers: headers).responseString  { response in
   
            if let json = response.result.value {
                UserDefaults.standard.set(json, forKey: "res")
            }
        }
    }


}
