//
//  RegistrationViewController.swift
//  Efe's Quiz
//
//  Created by Efe on 14.04.2022.
//

import Foundation
import UIKit

class RegistrationViewController : UIViewController {
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Title
        self.title = "Sign in"
        // Delegates
        emailTextField.delegate = self
        passwordTextField.delegate = self
        loginTextField.delegate = self
        //SetUps
        backgroundColor()
        setupTextFiledComponents()
        setupButton()
        //Targets
        registrationButton.addTarget(self, action: #selector(registrateButtonPressed(sender:)), for: .touchUpInside)
    }
    
    // MARK: Button
    let registrationButton : UIButton = {
        let registration = UIButton()
        registration.frame = CGRect(x: 130, y: 500, width: 170, height: 50)
        registration.setTitle("Registrate", for: .normal)
        registration.layer.cornerRadius = 15
        registration.layer.borderWidth = 3
        registration.layer.borderColor = UIColor.black.cgColor
        registration.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return registration
    }()
    
    // MARK: Registration Button Pressed
    
    @objc func registrateButtonPressed(sender : UIButton) {
        if sender == registrationButton {
            if passwordTextField.text!.isEmpty && loginTextField.text!.isEmpty && emailTextField.text!.isEmpty {
                alertForAll()
            }
            else if emailTextField.text!.isEmpty && loginTextField.text!.isEmpty {
                alertForEmailAndLogin()
            }
            
            else if emailTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
                alertForEmailAndPassword()
            }
            
            else if loginTextField.text!.isEmpty &&  passwordTextField.text!.isEmpty {
                alertForLoginAndPassword()
            }
            
            else if emailTextField.text!.isEmpty {
                alertForEmail()
            }
            else if loginTextField.text!.isEmpty {
                alertForLogin()
            }
            else if passwordTextField.text!.isEmpty {
                alertForPassword()
            }
            else if !emailTextField.text!.isEmpty {
                var charArr = [Character]()
                for i in emailTextField.text! {
                    charArr.append(i)
                }
                if !charArr.contains("@"){
                    alertForSymbol()
                }
            }
            if !passwordTextField.text!.isEmpty && !loginTextField.text!.isEmpty && !emailTextField.text!.isEmpty {
                show(QuizList(), sender: .none)
            }
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
    let emailTextField : UITextField = {
        let email = UITextField()
        email.attributedPlaceholder = NSAttributedString(string: "email".uppercased(), attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        email.leftViewMode = .always
        email.leftView = UIView(frame: CGRect(x:0,y:0,width:2,height:0))
        email.textContentType = .emailAddress
        email.keyboardType = .emailAddress
        email.layer.cornerRadius = 5
        email.backgroundColor = .black
        email.layer.borderWidth = 2
        email.layer.borderColor = UIColor.black.cgColor
        email.font = UIFont.boldSystemFont(ofSize: 13)
        return email
    }()
    
    let passwordTextField : UITextField = {
        let password = UITextField()
        password.attributedPlaceholder = NSAttributedString(string: "password".uppercased(), attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        password.leftViewMode = .always
        password.leftView = UIView(frame: CGRect(x:0,y:0,width:2,height:0))
        password.textContentType = .password
        password.keyboardType = .default
        password.isSecureTextEntry = true
        password.layer.cornerRadius = 5
        password.backgroundColor = .black
        password.layer.borderWidth = 2
        password.layer.borderColor = UIColor.black.cgColor
        password.font = UIFont.boldSystemFont(ofSize: 13)
        return password
    }()
    
    let loginTextField : UITextField = {
        let login = UITextField()
        login.attributedPlaceholder = NSAttributedString(string: "login".uppercased(), attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        login.leftViewMode = .always
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: 0))
        login.textContentType = .username
        login.layer.cornerRadius = 5
        login.backgroundColor = .black
        login.layer.borderWidth = 2
        login.layer.borderColor = UIColor.black.cgColor
        login.font = UIFont.boldSystemFont(ofSize: 13)
        return login
    }()
    // MARK: Background color of View
    func backgroundColor() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemGray.cgColor, UIColor.systemPink.cgColor]
        self.view.layer.addSublayer(layer)
    }
    // MARK: SetUp TextFiled Components
    func setupTextFiledComponents() {
        setupEmailComponents()
        setupPasswordComponents()
        setupLoginComponents()
    }
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
    
    // Email, Password, Login
    func setupEmailComponents() {
        view.addSubview(emailTextField)
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupPasswordComponents() {
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupLoginComponents() {
        view.addSubview(loginTextField)
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.topAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -60).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        loginTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}


// MARK: UIAlert
extension RegistrationViewController {
    
    func alertForEmail() {
        let alert = UIAlertController(title: "Your Email Bar is Empty!", message: "Please, type your email", preferredStyle: .alert)
        let alertButtonOk = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(alertButtonOk)
        self.present(alert, animated: true, completion: .none)
    }
    
    func alertForPassword() {
        let alert = UIAlertController(title: "Your Password Bar is Empty!", message: "Please, type your password", preferredStyle: .alert)
        let alertButtonOk = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(alertButtonOk)
        self.present(alert, animated: true, completion: .none)
    }
    
    func alertForAll() {
        let alert = UIAlertController(title: "Your Email, Login and Password Bars are Empty!", message: "Please, type your email, login and password", preferredStyle: .alert)
        let alertButtonOk = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(alertButtonOk)
        self.present(alert, animated: true, completion: .none)
        
    }
    func alertForSymbol() {
        let alert = UIAlertController(title: "It's not an email", message: "Please, type your email", preferredStyle: .alert)
        let alertButtonOk = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(alertButtonOk)
        self.present(alert, animated: true, completion: .none)
    }
    
    func alertForLogin() {
        let alert = UIAlertController(title: "Your Login Bar is Empty", message: "Please, type your login", preferredStyle: .alert)
        let alertButtonOk = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(alertButtonOk)
        self.present(alert, animated: true, completion: .none)
    }
    
    func alertForEmailAndLogin() {
        let alert = UIAlertController(title: "Your Email and Login Bars are Empty!", message: "Please, type your email and login", preferredStyle: .alert)
        let alertButtonOk = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(alertButtonOk)
        self.present(alert, animated: true, completion: .none)
    }
    func alertForEmailAndPassword() {
        let alert = UIAlertController(title: "Your Email and Password Bars are Empty!", message: "Please, type your email and password", preferredStyle: .alert)
        let alertButtonOk = UIAlertAction(title: "OK", style: .default, handler: .none)
        alert.addAction(alertButtonOk)
        self.present(alert, animated: true, completion: .none)
    }
    
    func   alertForLoginAndPassword() {
        let alert = UIAlertController(title: "Your Login and Password Bars are Empty!", message: "Please, type your login and password", preferredStyle: .alert)
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
            print("Resined Email")
        }
        else if textField == loginTextField {
            textField.resignFirstResponder()
            print("Resined Login")
        }
        else if textField == passwordTextField {
            textField.resignFirstResponder()
            print("Resined Password")
        }
        return true
    }
}
