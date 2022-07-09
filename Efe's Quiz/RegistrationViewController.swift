//  RegistrationViewController.swift
//  Efe's Quiz
//
//  Created by Efe on 14.04.2022.
import Foundation
import UIKit

class RegistrationViewController : UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var registrationButton: UIButton!
    
    @IBOutlet weak var alreadyHaveAccountButton: UIButton!
    
    @IBOutlet var outlets: [UITextField]!
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Title
        self.title = "Sign in"
        allSetUps()
        backgroundView()
        createRegistrationButton()
        //Func
        // Delegates
        //SetUps
    }
    
    // MARK: Button
     func createRegistrationButton() {
         if let registrationButton = registrationButton {
             registrationButton.layer.cornerRadius = 15
             registrationButton.layer.borderWidth = 3
             registrationButton.layer.borderColor = UIColor.black.cgColor
             registrationButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
             registrationButton.setTitle("Sign In", for: .normal)
    }
     }

    // MARK: Registration Button Pressed & Already Have Account Button Pressed
    
    @IBAction func registrateButtonPressed(_ sender: Any) {
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
    
    @IBAction func alreadyHaveAccountButton(_ sender: Any) {
        alreadyHaveAccountButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        alreadyHaveAccountButton.setAttributedTitle(attributedTitle, for: .normal)
        attributedTitle.append(NSMutableAttributedString(string: "Sign up", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white]))
    }
    
    @IBAction func alreadyHaveAccountButtonPressed(_ sender: Any) {
        show(QuizList(), sender: .none)
    }
    
    //MARK: OUTLETS DEFAULT SETUP USING OUTLETS COLLECTION
    func setUpOutlets() {
        if let outlets = outlets {
        for textField in outlets {
                textField.layer.cornerRadius = 5
                textField.layer.borderWidth = 2
                textField.layer.borderColor = UIColor.black.cgColor
                textField.delegate = self
            }
        }
    }
    
    //MARK: PUTTING TEXT FIELDS IN ONE FUNCTION
    func allSetUps() {
        setUpOutlets()
        createEmailTextField()
        createLoginTextField()
        createPasswordTextField()
    }
    
    //MARK: CREATING TEXT FIELDS
    func createEmailTextField() {
        if let emailTextField = emailTextField {
        emailTextField.leftViewMode = .always
        emailTextField.textContentType = .emailAddress
        emailTextField.keyboardType = .emailAddress
    }
    }
    // MARK: TextFields
    
     func createPasswordTextField() {
         if let passwordTextField = passwordTextField {
        passwordTextField.leftViewMode = .always
        passwordTextField.textContentType = .password
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
    }
     }
    func createLoginTextField() {
        if let loginTextField = loginTextField {
        loginTextField.leftViewMode = .always
        loginTextField.textContentType = .username
    }
    }

    
    // MARK: Background color of View
    func backgroundView() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemGray.cgColor, UIColor.systemPink.cgColor]
        self.view.layer.insertSublayer(layer, at: 0)
    }
}
    // MARK: SetUp TextFiled Components

    
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
