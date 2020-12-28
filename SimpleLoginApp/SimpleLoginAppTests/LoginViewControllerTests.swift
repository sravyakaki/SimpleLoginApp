//
//  LoginViewControllerTests.swift
//  SimpleLoginAppTests
//
//  Created by Sravya Kaki on 12/27/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import UIKit
import XCTest
import SimpleLoginApp

class LoginViewControllerTests: XCTestCase {
    
    var viewController: LoginViewController!

    override func setUpWithError() throws {
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
