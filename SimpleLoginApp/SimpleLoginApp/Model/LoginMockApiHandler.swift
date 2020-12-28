//
//  LoginMockApiHandler.swift
//  SimpleLoginApp
//
//  Created by Sravya Kaki on 12/24/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import Foundation

protocol LoginMockApiHandler {
    
    func loginHandler(completion: @escaping (Bool, LoginData?) -> Void)
}

final class loginAPIMockHandlerWithURL: LoginMockApiHandler {
    
    func loginHandler(completion: @escaping (Bool, LoginData?) -> Void) {
        HTTPClient.get(from: URL(string: "http://fireflysoftware.ca/login")!) { (json, error) in
            if error == nil {
                do {
                    let data = try JSONSerialization.data(withJSONObject: json as Any, options: [])
                    if let string = String(data: data, encoding: String.Encoding.utf8)?.data(using: .utf8) {
                        let loginData = try JSONDecoder().decode(LoginData.self, from: string)
                        completion(true, loginData)
                    }
                } catch {
                    completion(false, nil)
                }
            }
        }
    }
}

final class apiHandler: LoginMockApiHandler {

    private static let delay = 4

    func loginHandler(completion: @escaping (Bool, LoginData?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(apiHandler.delay)) {
                   let filePath = "credentials"
                   apiHandler.loadJsonDataFromFile(filePath, completion: { data in
                       if let json = data {
                           do {
                               let estimate = try JSONDecoder().decode(LoginData.self, from: json)
                               completion(true, estimate)
                           }
                           catch _ as NSError {
                               fatalError("Couldn't load data from \(filePath)")
                           }
                       }
                   })
               }
    }
    
    private static func loadJsonDataFromFile(_ path: String, completion: (Data?) -> Void) {
          if let fileUrl = Bundle.main.url(forResource: path, withExtension: "json") {
              do {
                  let data = try Data(contentsOf: fileUrl, options: [])
                  completion(data as Data)
              } catch (let error) {
                  print(error.localizedDescription)
                  completion(nil)
              }
          }
      }
}


