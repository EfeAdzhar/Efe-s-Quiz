//  StartViewController.swift
//  Efe's Quiz
//  Created by Efe on 16.06.2022.

import UIKit

class StartViewController: UIViewController {
    
    //MARK: Variables
    
//    var arrayTest1 = ["Walter", "White", "Alexsis", "Heisenberg"]
//    var arrayTest2 = ["1", "4", "5", "Alexsis"]
    
    var tryAgainButton = UIButton()
    var congratulationButton = UIButton()
   lazy var integer = 0
//    var rightAnswear = false
    var label = UILabel()
    var counterLabel = UILabel()
    var tableView =  UITableView()
    var count = UILabel()
    var gameQuestions = [Question]()
    var currentQuestion : Question?
    
    //MARK: Question Variable
    
    //MARK: ViewDidLoad
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFunc()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "answers")
        tryAgainButton.addTarget(self, action: #selector(tryAgainButtonPressed(_:)), for: .touchUpInside)
        congratulationButton.addTarget(self, action: #selector(congratulationsButtonPressed(_:)), for: .touchUpInside)
    }
    
    func setUpFunc() {
        backgroundColor()
        tableViewSetUp()
        question()
        counter()
        amount()
        setUpTryAgainButton()
        setUpCongratulationButton()
        setupQuestions()
        configure(question: gameQuestions.first!)
    }
    
//MARK: Settings
    
    func configure(question : Question) {
        label.text = question.text
        currentQuestion = question
        tableView.reloadData()
    }
    
    func checkAnswear(answear : Answers, question : Question) -> Bool {
        //return result if answears of a giving question contains something with a text that maches to answear that we are passing in and if the answear choise is correct
        return question.answears.contains(where: {$0.answears == answear.answears}) && answear.choise
    }
    
    //MARK: Questions
    
    func setupQuestions() {
        
        gameQuestions.append(Question(text: "Question 1: Say my Name...", answears: [
Answers(choise: false, answears: "Walter", commentaries: "Are you OK?"),
Answers(choise: false, answears: "White", commentaries: "REALLY?"),
Answers(choise: false, answears: "Alexsis", commentaries: "What do we have here, a comedian?"),
Answers(choise: true, answears: "Heisenberg", commentaries: "You're God damn right")
        ]))
        
            gameQuestions.append(Question(text: "Question 2: What is 2+2?", answears: [
Answers(choise: false, answears:  "1", commentaries: "WOW, YOU'RE SOME KIND OF A MAGISIAN?"),
Answers(choise: true, answears: "4", commentaries: "Congrats, there was a point of going to school"),
Answers(choise: false, answears: "5", commentaries: "How about that, Elon Musk?"),
Answers(choise: false, answears: "Alexsis", commentaries: "What do we have here, a second comedian?")
            ]))
    }
    
    func setUpTryAgainButton() {
        tryAgainButton.isHidden = true
        tryAgainButton.frame = CGRect(x: 150, y: 300, width: 100, height: 20)
        tryAgainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        let attributeTitle = NSMutableAttributedString(string: "Try Again?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        tryAgainButton.setAttributedTitle(attributeTitle, for: .normal)
        self.view.addSubview(tryAgainButton)
    }
    
    func setUpCongratulationButton() {
        congratulationButton.isHidden = true
        congratulationButton.frame = CGRect(x: 150, y: 300, width: 200, height: 20)
        let attributedTitle = NSMutableAttributedString(string: "YOU MADE IT!", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        congratulationButton.setAttributedTitle(attributedTitle, for: .normal)
        congratulationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(congratulationButton)
    }
    
    func tableViewSetUp() {
        self.tableView = UITableView(frame: CGRect(x: 10, y: 300, width: 400 , height: 180), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func backgroundColor() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemRed.cgColor, UIColor.systemBlue.cgColor]
        self.view.layer.insertSublayer(layer, at: 0)
    }
    
    func question() {
        self.label.frame = CGRect(x: 10, y: 80, width: 500, height: 30)
        self.label.lineBreakMode = .byWordWrapping
        self.label.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(label)
    }
    
    func amount() {
        self.count.frame = CGRect(x: 260, y: 100, width: 500, height: 200)
        self.count.text = "0"
        self.count.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(count)
    }
    
    func counter() {
        self.counterLabel.frame = CGRect(x: 100, y: 100, width: 500, height: 200)
        self.counterLabel.text = "Right Answears: "
        self.counterLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(counterLabel)
    }
}

//MARK: Logic

extension StartViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answears.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "answers", for: indexPath)
        
        cell.textLabel?.text = currentQuestion?.answears[indexPath.row].answears
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
      
        guard let questions = currentQuestion else {return}
        let answears = questions.answears[indexPath.row]
        
        if checkAnswear(answear: answears, question: questions) {
            //correct
            if let index = gameQuestions.firstIndex(where: {$0.text == questions.text}) {
                if index < gameQuestions.count-1 {
                  let nextQuestion = gameQuestions[index+1]
                    currentQuestion = nil
                    configure(question: nextQuestion)
                }
                if questions.answears[indexPath.row].choise {
                    integer += 1
                    count.text = String(integer)
                }
                if index == gameQuestions.lastIndex(where: {$0.text == questions.text}) && integer == 2 {
                    tableView.isHidden = true
                    count.text = "Congratulations, 2 right answears!"
                    self.counterLabel.frame = CGRect(x: 20, y: 100, width: 500, height: 200)
                    self.count.frame = CGRect(x: 80, y: 130, width: 500, height: 200)
                    congratulationButton.isHidden = false
                }
//                if index == gameQuestions.lastIndex(where: {$0.text == questions.text}) && integer == 1 {
//                    tableView.isHidden = true
//                    count.text = "Congratulations, 1 right answears!"
//                    self.counterLabel.frame = CGRect(x: 20, y: 100, width: 500, height: 200)
//                    congratulationButton.isHidden = false
//            }
          }
        }
        
        if checkAnswear(answear: answears, question: questions) != true {
            
            if let index = gameQuestions.firstIndex(where: {$0.text == questions.text}) {
                
                if index < gameQuestions.count-1 && answears.choise != true {
            label.text = answears.commentaries
            integer -= 1
            count.text = String(integer)
        }
            if index == gameQuestions.lastIndex(where: {$0.text == questions.text}) && integer < 0 {
            count.text = "Game Over"
            tableView.isHidden = true
            tryAgainButton.isHidden = false
        }
    }
        }
    }

    @objc func tryAgainButtonPressed(_ sender : UIButton) {
        if sender == tryAgainButton.self {
            viewDidLoad()
            tableView.reloadData()
        }
    }

    @objc func congratulationsButtonPressed(_ sender : UIButton) {
        if sender == congratulationButton.self {
            viewDidLoad()
            tableView.reloadData()
        }
    }
}

//MARK: STRUCT OF QUESTIONS AND ANSWEARS
struct Question {
    var text : String
    var answears : [Answers]
}

struct Answers {
    
    var choise : Bool
    var answears : String
    var commentaries : String
    
    init (choise : Bool, answears : String, commentaries : String) {
        self.choise = choise
        self.answears = answears
        self.commentaries = commentaries
    }
}
    
    //MARK: MY VERSION OF QUIZ. SADLY IT'S NOT WORKING CORRECTLY :(

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   //
   //        tableView.deselectRow(at: indexPath, animated: true)
   //
   //        if rightAnswear == false {
   //
   //             label.text = "Question 1: Say my Name..."
   //
   //                switch arrayTest1[indexPath.row] {
   //                    case "Walter":
   //                    label.text = "Are you OK?"
   //                    rightAnswear = false
   //
   //                    case "White":
   //                    label.text = "REALLY?"
   //                    rightAnswear = false
   //
   //                    case "Alexsis":
   //                    label.text = "What do we have here, a comedian?"
   //                    rightAnswear = false
   //
   //                    case "Heisenberg" :
   //                    label.text = "You're God damn right"
   //                    self.integer += 1
   //                    rightAnswear = true
   //
   //                    default:
   //                    print("study hard and hardcode and you will succseed")
   //                }
   //
   //            if rightAnswear == false {
   //                   integer -= 1
   //                   count.text = String(integer)
   //            }
   //
   //            if integer < 0 {
   //                self.count.text = "Game Over"
   //                self.tableView.isHidden = true
   //                self.tryAgainButton.isHidden = false
   //            }
   //
   //            //MARK: QUESTION 2
   //            if rightAnswear == true {
   //                self.count.text = String(integer)
   //                self.index += 1
   //                self.label.text = "Question 2: What is 2+2?"
   //                self.rightAnswear = false
   //                self.tableView.reloadData()
   //                switch arrayTest2[indexPath.row] {
   //
   //                    case "1":
   //                    label.text = "WOW, YOU'RE SOME KIND OF A MAGISIAN?"
   //                    rightAnswear = false
   //                    case "4":
   //                    label.text = "Congrats, there was a point of going to school"
   //                    rightAnswear = true
   //                    case "5":
   //                    label.text = "How about that, Elon Musk?"
   //                    rightAnswear = false
   //                    case "Alexsis" :
   //                    label.text = "What do we have here, a second comedian?"
   //                    rightAnswear = false
   //                    default:
   //                    print("study hard and hardcode and you will succseed")
   //                        }
   //
   //                    if rightAnswear == true {
   //                        self.integer += 1
   //                        self.index += 1
   //                        self.count.text = String(integer)
   //                    }
   //
   //                    if rightAnswear == false {
   //                        self.integer -= 1
   //                        self.count.text = String(integer)
   //                    }
   //                    if integer < 0 {
   //                        self.count.text = "Game Over"
   //                        self.tableView.isHidden = true
   //                        self.tryAgainButton.isHidden = false
   //                 }
   //               }
   //        }
   //
   //
   //        if rightAnswear == true && integer == 2 {
   //            congratulationButton.isHidden = false
   //            label.text = "Congratulations, you did it! 2 right answers!"
   //        }
   //
   //        if rightAnswear == true && integer == 1 {
   //            congratulationButton.isHidden = false
   //            label.text = "Not bad, kido. 1 answear"
   //        }
   //
   //        }
   //
   //    @objc func tryAgainButtonPressed(_ sender : UIButton) {
   //        if sender == tryAgainButton.self {
   //            viewDidLoad()
   //            tableView.reloadData()
   //        }
   //    }
   //
   //    @objc func congratulationsButtonPressed(_ sender : UIButton) {
   //        if sender == congratulationButton.self {
   //            viewDidLoad()
   //            tableView.reloadData()
   //
   //        }
   //    }
   //}
