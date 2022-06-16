//
//  RegistrationViewController.swift
//  Efe's Quiz
//
//  Created by Efe on 14.04.2022.
//

import Foundation
import UIKit

class RegistrationViewController : UIViewController {
    
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Title
        self.title = "Sign in"
        //Func
        createEmailTextField()
        createPasswordTextField()
        createLoginTextField()
        createRegistrationButton()
        // Delegates
        emailTextField.delegate = self
        passwordTextField.delegate = self
        loginTextField.delegate = self
        //SetUps
        backgroundColor()
        setupButton()
        //Targets
        registrationButton.addTarget(self, action: #selector(registrateButtonPressed(sender:)), for: .touchUpInside)
        alreadyHaveAccountButton.addTarget(self, action: #selector(alreadyHaveAccountButtonPressed(sender:)), for: .touchUpInside)
    }
    
    // MARK: Button
    func createRegistrationButton() {
        registrationButton.frame = CGRect(x: 130, y: 500, width: 170, height: 50)
        registrationButton.backgroundColor = .systemPink
        registrationButton.setTitleColor(.white, for: .normal)
        registrationButton.setTitle("Registrate", for: .normal)
        registrationButton.layer.cornerRadius = 15
        registrationButton.layer.borderWidth = 3
        registrationButton.layer.borderColor = UIColor.black.cgColor
        registrationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(registrationButton)
    }
    
    // MARK: Registration Button Pressed & Already Have Account Button Pressed
    
    @objc func registrateButtonPressed(sender : UIButton) {
        if sender == registrationButton {
            if passwordTextField.text!.isEmpty && loginTextField.text!.isEmpty && emailTextField.text!.isEmpty {
                alerts(title: "Your Email, Login and Password Bars are Empty!", message: "Please, type your email, login and password", preferredStyle: .alert)
            }
            else if emailTextField.text!.isEmpty && loginTextField.text!.isEmpty {
                alerts(title: "Your Email and Login Bars are Empty!", message: "Please, type your email and login", preferredStyle: .alert)
            }
            
            else if emailTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
                alerts(title: "Your Email and Password Bars are Empty!", message: "Please, type your email and password", preferredStyle: .alert)
            }
            
            else if loginTextField.text!.isEmpty &&  passwordTextField.text!.isEmpty {
                alerts(title: "Your Login and Password Bars are Empty!", message: "Please, type your login and password", preferredStyle: .alert)
            }
            
            else if emailTextField.text!.isEmpty {
                alerts(title: "Your Email Bar is Empty!", message: "Please, type your email", preferredStyle: .alert)
            }
            else if loginTextField.text!.isEmpty {
                alerts(title: "Your Login Bar is Empty!", message: "Please, type your login", preferredStyle: .alert)
            }
            else if passwordTextField.text!.isEmpty {
                alerts(title: "Your Password Bar is Empty!", message: "Please, type your password", preferredStyle: .alert)
            }
            else if !emailTextField.text!.isEmpty {
                var charArr = [Character]()
                for i in emailTextField.text! {
                    charArr.append(i)
                }
                if !charArr.contains("@"){
                    alerts(title: "It's not an email", message: "Please, type your email", preferredStyle: .alert)
                }
            }
            if !passwordTextField.text!.isEmpty && !loginTextField.text!.isEmpty && !emailTextField.text!.isEmpty {
                show(QuizList(), sender: .none)
                
            }
        }
    }
    
    @objc func alreadyHaveAccountButtonPressed(sender : UIButton) {
        if sender == alreadyHaveAccountButton {
            show(QuizList(), sender: .none)
            // It will be like this for now, cause It's just a test app and I need a quick access
        }
    }
    
    let alreadyHaveAccountButton : UIButton = {
        var accountButton = UIButton(type: .system)
        accountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        accountButton.setAttributedTitle(attributedTitle, for: .normal)
        attributedTitle.append(NSAttributedString(string: " Sign up", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white]))
        return accountButton
    }()
    
    // MARK: TextFields
    func createEmailTextField() {
        emailTextField.leftViewMode = .always
        emailTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:2,height:0))
        emailTextField.textContentType = .emailAddress
        emailTextField.keyboardType = .emailAddress
        emailTextField.layer.cornerRadius = 5
        emailTextField.backgroundColor = .black
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.font = UIFont.boldSystemFont(ofSize: 13)
        self.view.addSubview(emailTextField)
    }

    func createPasswordTextField() {
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:2,height:0))
        passwordTextField.textContentType = .password
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.backgroundColor = .black
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.font = UIFont.boldSystemFont(ofSize: 13)
        self.view.addSubview(passwordTextField)
    }
    
    
    func createLoginTextField() {
    loginTextField.leftViewMode = .always
    loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 0))
    loginTextField.textContentType = .username
    loginTextField.layer.cornerRadius = 5
    loginTextField.backgroundColor = .black
    loginTextField.layer.borderWidth = 2
    loginTextField.layer.borderColor = UIColor.black.cgColor
    loginTextField.font = UIFont.boldSystemFont(ofSize: 13)
        self.view.addSubview(loginTextField)
    }
    
    // MARK: Background color of View
    func backgroundColor() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemGray.cgColor, UIColor.systemPink.cgColor]
        self.view.layer.addSublayer(layer)
    }
    // MARK: SetUp TextFiled Components
    
    // Button
    func setupButton() {
        setupRegistrationButton()
        setupAlreadyHaveAccountButton()
    }
    
    func setupRegistrationButton() {
        self.view.addSubview(registrationButton)
    }
    
    func setupAlreadyHaveAccountButton() {
        self.view.addSubview(alreadyHaveAccountButton)
        
        alreadyHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        alreadyHaveAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        alreadyHaveAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        alreadyHaveAccountButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
    
// MARK: UIAlert
extension RegistrationViewController {
    func alerts(title : String, message : String, preferredStyle: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let alertButtonOk = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(alertButtonOk)
        self.present(alert, animated: true, completion: .none)
    }
}

// MARK: Delegate Text
extension RegistrationViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            textField.resignFirstResponder()
        }
        else if textField == loginTextField {
            textField.resignFirstResponder()
        }
        else if textField == passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
}
