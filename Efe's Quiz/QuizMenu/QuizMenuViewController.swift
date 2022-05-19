//  QuizMenuViewController.swift
//  Efe's Quiz
//
//  Created by Efe on 27.04.2022.

//import Foundation
//import UIKit
//
//class QuizMenuViewController : UIViewController {
//    var scrollView = UIScrollView()
//    var buttonTestArray = [UIButton]()
//
//    func appendToArray(array : [UIButton], button : UIButton) {
//        buttonTestArray.append(button)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "Quiz Menu"
//        self.view.addSubview(scrollView)
//        backgroundColor()
//
//        testSetUps()
//    }
//
//    func backgroundColor() {
//        let layer = CAGradientLayer()
//        layer.frame = self.view.bounds
//        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemGray.cgColor, UIColor.systemPink.cgColor]
//        self.view.layer.addSublayer(layer)
//    }
//
//    var politicalButton : UIButton = {
//        var button = UIButton(type: .system)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
//        let attributedTitle = NSMutableAttributedString(string: "What is your political orientation?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
//        button.setAttributedTitle(attributedTitle, for: .normal)
//        button.layer.cornerRadius = 15
//        button.layer.borderWidth = 3
//        button.layer.borderColor = UIColor.black.cgColor
//        return button
//    }()
//
//    func testSetUps() {
//        setupPoliticalButton()
//    }
//
//    func setupPoliticalButton() {
//        view.addSubview(politicalButton)
//
//        appendToArray(array: buttonTestArray, button: politicalButton)
//
//        politicalButton.translatesAutoresizingMaskIntoConstraints = false
//        politicalButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
//        politicalButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
//        politicalButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
//        politicalButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//    }
//}
