//
//  WelcomeViewController.swift
//  SimpleLoginApp
//
//  Created by Sravya Kaki on 12/25/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var usernameLabel: UILabel!
    
    var usernameFromLoginVC = ""
    
    private var loginData: LoginData?
    private let api: LoginMockApiHandler = {
               return apiHandler()
       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = usernameFromLoginVC
    }
        
        
    
}
