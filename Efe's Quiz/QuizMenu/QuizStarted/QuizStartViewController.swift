//
//  QuizStartViewController.swift
//  Efe's Quiz
//
//  Created by Efe on 19.05.2022.
//

import UIKit


class QuizStartViewController: UIViewController {
    var descriptionsLabel = UILabel()
    var imageView = UIImageView()
    let quiz : String
    var image : UIImage
    var descriptions : String
    let startButtonImage = UIImage(named: "start_button")
    
    init(quiz : String, image : UIImage, descriptions : String) {
        self.image = image
        self.quiz = quiz
        self.descriptions = descriptions
        
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuizStartView()
        startButton.addTarget(self, action: #selector(startButtonPressed(sender:)), for: .touchUpInside)
    }
    
    
    
    func setupQuizStartView() {
        backgroundView()
        quizImage()
        descriptionsLabels()
        setupStartButton()
    }
    
    func backgroundView() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemGray.cgColor, UIColor.systemPink.cgColor]
        self.view.layer.addSublayer(layer)
        self.title = quiz.uppercased()
    
        }
    func quizImage() {
        imageView.image = image
        imageView.frame = CGRect(x: 6, y: 100, width: 403, height: 300)
        imageView.layer.cornerRadius = 0
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(imageView)
        
    }
    func descriptionsLabels() {
        descriptionsLabel.frame = CGRect(x: 20, y: 400, width: 400, height: 300)
        descriptionsLabel.font = UIFont.boldSystemFont(ofSize: 30)
        descriptionsLabel.textColor = .white
        descriptionsLabel.numberOfLines = -1
        descriptionsLabel.lineBreakMode = .byWordWrapping
        descriptionsLabel.text = descriptions
        self.view.addSubview(descriptionsLabel)
    }
    
    var startButton : UIButton = {
        var startButton = UIButton()
        startButton.layer.borderWidth = 3
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.cornerRadius = 15
        return startButton
    }()
    
    func setupStartButton() {
        self.view.addSubview(startButton)
        
        startButton.setImage(startButtonImage, for: .normal)
        startButton.imageView?.layer.masksToBounds = true
        startButton.imageView?.layer.borderWidth = 3
        startButton.imageView?.layer.borderColor = UIColor.black.cgColor
        startButton.imageView?.layer.cornerRadius = 15
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.topAnchor.constraint(equalTo: descriptionsLabel.bottomAnchor, constant: 10).isActive = true
        startButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80).isActive = true
        startButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    @objc func startButtonPressed(sender : UIButton) {
            self.present(UINavigationController(rootViewController: StartViewController()), animated: true)
  }
}
