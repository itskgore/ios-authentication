//
//  ApiManager.swift
//  OnboardingScreen
//
//  Created by Ashutosh Arage on 09/09/20.
//  Copyright © 2020 Ashutosh Arage. All rights reserved.
//

import Foundation
import Alamofire
class APIManager {
    
    
    /// Request Headers
       var headers : HTTPHeaders = []
    
    
    static let shared = APIManager()
    
    func registerAPI(register: RegisterModel,completionHandler: @escaping (Bool,Any)->()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(Constansts.registerURL, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{
            repsonse in
            switch repsonse.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if(repsonse.response?.statusCode == 200) {
                        completionHandler(true,json)
                    }else {
                        completionHandler(false,"Not registered")
                    }
                }catch{
                    print(error)
                    completionHandler(false,"Not registered")
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
    }
    
    
    
    /// global API call func
    //1. HTTP METHOD .post
    //2. parameters if not send nil
    //3. url send with base baseul and other
    //4. completion handler returns response
    func hitAPI(httpMethod: HTTPMethod, parameters:[String:Any]?,url:String,header:HTTPHeader,completionHandler: (([String:Any]) -> Void)!) -> Void {
        if(!headers.contains(header)) {
            headers.add(header)
        }
        var encoding : ParameterEncoding!
        if(httpMethod == .get) {
            encoding = URLEncoding.default
        }
        else {
            encoding = JSONEncoding.default
        }
        
        AF.request(url, method: httpMethod, parameters: parameters, encoding: encoding, headers: headers).responseJSON { response in
            
               
                switch response.result {
                case .success(let data):
                    if(response.response?.statusCode == 200) {
                        let response = data as! [String : Any]
                        completionHandler(response)
                    }else {
                        let response = data as! [String : Any]
                       completionHandler(response)
                    }
                    
                    break
                case .failure(let err):
                    let response: [String : Any] = ["error":true,
                                                    "msg":err.localizedDescription]
                    completionHandler(response)

                }
            
            
        }
        
    }
}
