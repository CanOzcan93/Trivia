//
//  TRNetworkManager.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation
//import Alamofire
//import SwiftyJSON
//import SwiftWebSocket

open class TRNetworkManager: NSObject {
    
//    private var sockets = [String: SRWebSocket]()
//
    public required override init() {

    }
//
//    public static func getJson(url: String,completition: @escaping (JSON)->() ){
//        var jsonDict = JSON()
//
//        Alamofire.request(url).validate().responseJSON { (response) in
//            if let jsonnable = response.result.value {
//                jsonDict = JSON(jsonnable)
//            }
//            completition(jsonDict)
//        }
//    }
//
//    public static func post(url: String, body: String, completition: @escaping (JSON, [AnyHashable : Any]?)->() ){
//        var jsonDict = JSON()
//
//        Alamofire.request(url, method: .post, parameters: [:], encoding: body, headers: [:]).responseJSON { (response) in
//            if let jsonnable = response.result.value {
//                jsonDict = JSON(jsonnable)
//            }
//            completition(jsonDict, response.response?.allHeaderFields)
//        }
//    }
//
//    public static func postWithHeader(url: String, body: String, headers:[String:String], completition: @escaping (JSON, [AnyHashable : Any]?)->()) {
//
//        var jsonDict = JSON()
//
//        Alamofire.request(url, method: .post, parameters: [:], encoding: body, headers: headers).responseJSON { (response) in
//            if let jsonnable = response.result.value {
//                jsonDict = JSON(jsonnable)
//            }
//            completition(jsonDict, response.response?.allHeaderFields)
//        }
//
//    }
//
//    public static func multiPartPostWithImages(url: String, parameters: [String:Any], headers:[String:String], photos:[String:UIImage]?, completion: @escaping (JSON, [AnyHashable : Any]?)->()) {
//
//        var jsonDict = JSON()
//
//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//            for (key,value) in parameters {
//
//                if JSONSerialization.isValidJSONObject(value) {
//                    let data = try! JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
//                    if let jsonString = String(data: data, encoding: .utf8) {
//                        multipartFormData.append(jsonString.data(using: .utf8)!, withName: key)
//                    }
//                } else {
//                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//                }
//            }
//
//            if photos != nil {
//                for (key, photo) in photos! {
//                    multipartFormData.append(photo.jpegData(compressionQuality: 0.2)!, withName: key, fileName: "\(key).jpg", mimeType: "image/*")
//                }
//            }
//
//        }, to: url, headers: headers ) { (result) in
//            switch result {
//            case .success(let upload,let a,let b):
//                upload.uploadProgress { progress in
//                    print("\(progress) \n")
//                }
//                upload.responseJSON { (response) in
//                    if let jsonnable = response.result.value {
//                        jsonDict = JSON(jsonnable)
//                        completion(jsonDict, response.response?.allHeaderFields)
//                    }
//                }
//            case .failure(let encodingError):
//                break
//            }
//        }
//
//    }
//
//    public static func postWithUrlParameters(url: String, parameters: Dictionary<String,AnyObject>, completition: @escaping (JSON, [AnyHashable : Any]?)->() ){
//        var jsonDict = JSON()
//
//        Alamofire.request(url, method: .post, parameters: parameters).responseJSON { (response) in
//            if let jsonnable = response.result.value {
//                jsonDict = JSON(jsonnable)
//            }
//            completition(jsonDict, response.response?.allHeaderFields)
//        }
//    }
//
//    public func getSocket(spec: String) -> SRWebSocket? {
//        guard let findedSocket = sockets[spec] else {
//            return nil
//        }
//        return findedSocket
//    }
//
//    public func setSocket(socket: SRWebSocket, spec: String) {
//        sockets[spec] = socket
//    }
//
//    public func deleteSocket(spec: String){
//        sockets[spec] = nil
//    }
    
}
