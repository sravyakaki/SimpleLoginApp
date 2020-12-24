//
//  ViewController.swift
//  SimpleLoginApp
//
//  Created by Sravya Kaki on 12/23/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK :- Outlet Connections
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginErrorDescriptionLabel: UILabel!
    @IBOutlet var loginButton: UIButton!
    
    
    //MARK :- View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldProperties()
        // Do any additional setup after loading the view.
    }
    
    //MARK :- Button Action Outlet
    @IBAction func loginButtonClicked(_ sender: Any) {
    }
    
    
    func setupTextFieldProperties() {
        usernameTextField.borderStyle = UITextField.BorderStyle.bezel
        passwordTextField.borderStyle = UITextField.BorderStyle.bezel
    }


}

