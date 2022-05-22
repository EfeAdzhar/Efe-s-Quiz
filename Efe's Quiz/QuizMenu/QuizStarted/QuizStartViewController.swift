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
    }
    
    
    func setupQuizStartView() {
        backgroundView()
        quizImage()
        descriptionsLabels()
        
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
        descriptionsLabel.frame = CGRect(x: 20, y: 400, width: 400, height: 200)
        descriptionsLabel.font = UIFont.boldSystemFont(ofSize: 30)
        descriptionsLabel.textColor = .white
        descriptionsLabel.numberOfLines = -1
        descriptionsLabel.lineBreakMode = .byWordWrapping
        descriptionsLabel.text = descriptions
        self.view.addSubview(descriptionsLabel)
    }
    
}