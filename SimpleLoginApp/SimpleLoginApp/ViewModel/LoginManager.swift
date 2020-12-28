//
//  LoginManager.swift
//  SimpleLoginApp
//
//  Created by Sravya Kaki on 12/24/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import Foundation

protocol LoginManagerProtocol {
    func loginWithCredentials(username: String, password: String)
}

class LoginManager: LoginManagerProtocol {

    var username = ""
    var password = ""
    
    func loginWithCredentials(username: String, password: String) {
        // perform your production login here
        self.username = username
        self.password = password
    }
}
