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
    
    //MARK :- Stored Properties
    private var activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    var loginManagerViewModel: LoginManagerViewModel!
    
    private var loginData: LoginData? {
        didSet {
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    
    private let api: LoginMockApiHandler = {
          
               return apiHandler()
       }()
    
    
    //MARK :- View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldProperties()
        setupDelegates()
        bindData()

    }
    
    //MARK :- Button Action Outlet
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        // ViewModel will update model with existing credentials from text fields
        loginManagerViewModel.updateCredentials(username: usernameTextField.text!, password: passwordTextField.text!)

        //Here we check user's credentials input - if it's correct we call login()
        switch loginManagerViewModel.credentialsInput() {
            
        case .Correct:
            login()
            self.performSegue(withIdentifier: "showUsernameSegue", sender: self)

        case .Incorrect:
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let welcomeViewController = segue.destination as! WelcomeViewController
        welcomeViewController.usernameFromLoginVC = usernameTextField.text!
    }
    
    func setupTextFieldProperties() {
        usernameTextField.borderStyle = UITextField.BorderStyle.bezel
        passwordTextField.borderStyle = UITextField.BorderStyle.bezel
    }
    
    func setupDelegates() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func highlightTextField(_ textField: UITextField) {
           textField.resignFirstResponder()
           textField.layer.borderWidth = 1.0
           textField.layer.borderColor = UIColor.red.cgColor
           textField.layer.cornerRadius = 3
    }
    
    func removeHighlightTextField(_ textField: UITextField) {
            textField.resignFirstResponder()
        textField.layer.borderColor = UIColor.gray.cgColor
            
     }
    
    
    
    func bindData() {
             loginManagerViewModel.credentialsInputEmptyErrorMessage.bind {
                 self.loginErrorDescriptionLabel.isHidden = true
                 self.loginErrorDescriptionLabel.text = $0
                let alert = UIAlertController(
                               title: "Invalid Login",
                               message: "Please enter username and password",
                               preferredStyle: UIAlertController.Style.alert)

                           let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                           }

                           alert.addAction(OKAction)

                self.present(alert, animated: true, completion: nil)
             }
             
             loginManagerViewModel.isUsernameTextFieldHighLighted.bind {
                 if $0 { self.highlightTextField(self.usernameTextField)}
             }
             
             loginManagerViewModel.isPasswordTextFieldHighLighted.bind {
                 if $0 { self.highlightTextField(self.passwordTextField)}
             }
            loginManagerViewModel.credentialsInputErrorMessage.bind {
            self.loginErrorDescriptionLabel.isHidden = true
            self.loginErrorDescriptionLabel.text = $0
            let alert = UIAlertController(
                title: "Invalid Login",
                message: "Username and Password should contain at least a letter and a number ",
                preferredStyle: UIAlertController.Style.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.usernameTextField.text = ""
                self.passwordTextField.text = ""
                self.removeHighlightTextField(self.passwordTextField)
                self.removeHighlightTextField(self.usernameTextField)
                
            }
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func login() {
            activityIndicatorView.style = UIActivityIndicatorView.Style.large
            activityIndicatorView.backgroundColor = .gray
            view.addSubview(activityIndicatorView)
            activityIndicatorView.startAnimating()
            loginManagerViewModel.login { error in
           }
    }
    
    
}

    //MARK :- Text Field Delegates
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

