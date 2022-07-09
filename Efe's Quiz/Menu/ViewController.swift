//  ViewController.swift
//  Efe's Quiz
//  Created by Efe on 14.04.2022.

//MARK: Welcome Page of The App. It contains only "Sign in" button with text :)

import UIKit
//MARK: ViewController
class ViewController: UIViewController {
    //MARK: Elements
    @IBOutlet weak var signInButton: UIButton!
    let welcomeLabel = UILabel()
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome"
        createSignInButton()
        creatingTextLabel()
        backgroundView()
    }
    
    //MARK: Creating Elements
    //Sing in Button
    func createSignInButton() {
        signInButton.layer.cornerRadius = 15
        signInButton.layer.borderWidth = 3
        signInButton.layer.borderColor = UIColor.black.cgColor
        signInButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        signInButton.tintColor = .black
        signInButton.setTitle("Start", for: .normal)
        signInButton.backgroundColor = .systemBlue
    }

    //Label
    func creatingTextLabel() {
        welcomeLabel.frame = CGRect(x: 0, y: 0, width: 350, height: 200)
        welcomeLabel.center = self.view.center
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 30)
        welcomeLabel.textColor = .white
        welcomeLabel.numberOfLines = 4
        welcomeLabel.lineBreakMode = .byWordWrapping
        welcomeLabel.text = "Hello and Welcome to my Quiz App. It's my first serious app. Hope you enjoy :)"
        self.view.addSubview(welcomeLabel)
    }
    
    //MARK: Background Color
    func backgroundView() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemGray.cgColor, UIColor.systemPink.cgColor]
        self.view.layer.insertSublayer(layer, at: 0)
    }
    
    //MARK: Go To Registration ViewController
    
    @IBAction func pressed(_ sender: Any) {
       
        show(QuizList(), sender: .none)
        
        }
    }


