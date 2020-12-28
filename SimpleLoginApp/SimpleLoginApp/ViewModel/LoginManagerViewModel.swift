//
//  File.swift
//  SimpleLoginApp
//
//  Created by Sravya Kaki on 12/24/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import Foundation
import UIKit

class LoginManagerViewModel {
    
    private let loginManager: LoginManager
    private var username = ""
    private var password = ""
    
    // Property Observer
    private var credentials = LoginCredentials() {
        didSet {
            username = credentials.username
            password = credentials.password
        }
        
    }
    
    var credentialsInputEmptyErrorMessage: LoginErrorHandler<String> = LoginErrorHandler("")
    var credentialsInputErrorMessage: LoginErrorHandler<String> = LoginErrorHandler("")
    var isUsernameTextFieldHighLighted: LoginErrorHandler<Bool> = LoginErrorHandler(false)
    var isPasswordTextFieldHighLighted: LoginErrorHandler<Bool> = LoginErrorHandler(false)
    
    init(loginManager: LoginManager) {
        self.loginManager = loginManager
    }
    
    func updateCredentials(username: String, password: String) {
        credentials.username = username
        credentials.password = password
    }
    
    func login(completion: @escaping (Error?) -> Void) {
        loginManager.loginWithCredentials(username: username, password: password)
        
        /* { (error) in
            guard let error = error else {
                completion(nil)
                return
            }
            
            completion(error)
        }*/
    }
    
    func credentialsInput() -> CredentialsInputStatus {
        if username.isEmpty && password.isEmpty {
            credentialsInputEmptyErrorMessage.value = "Please provide username and password."
            return .Incorrect
        }
        if username.isEmpty {
            credentialsInputEmptyErrorMessage.value = "Username field is empty."
            isUsernameTextFieldHighLighted.value = true
            return .Incorrect
        }
        if password.isEmpty {
            credentialsInputEmptyErrorMessage.value = "Password field is empty."
            isPasswordTextFieldHighLighted.value = true
            return .Incorrect
        }
        if !(username.isEmpty) && !(password.isEmpty) {
            let regexPattern = "([A-Za-z]+[0-9]|[0-9]+[A-Za-z])[A-Za-z0-9]*"
            let result = NSPredicate(format: "SELF MATCHES %@", regexPattern)
            let isUsernameValid = result.evaluate(with: username)
            let isPasswordValid = result.evaluate(with: password)
            
            if isUsernameValid && isPasswordValid {
                return .Correct
            } else {
                credentialsInputErrorMessage.value = "Username and Password should contain at least a letter and a number "
                return .Incorrect
            }
        }
        
        return .Correct
    }
}

extension LoginManagerViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}
