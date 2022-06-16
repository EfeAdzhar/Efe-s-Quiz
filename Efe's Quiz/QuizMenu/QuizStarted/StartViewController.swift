//
//  StartViewController.swift
//  Efe's Quiz
//
//  Created by Efe on 16.06.2022.
//

import UIKit

class StartViewController: UIViewController {
var arrayTest = ["Walter", "White", "Alexsis", "Heisenberg"]
   lazy var integer = 0
    var label = UILabel()
    var counterLabel = UILabel()
    var tableView =  UITableView()
    var count = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFunc()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "answers")
    }
    
    func setUpFunc() {
        backgroundColor()
        tableViewSetUp()
        question()
        counter()
        amount()
    }
    
    
    func tableViewSetUp() {
        self.tableView = UITableView(frame: CGRect(x: 10, y: 300, width: 400 , height: 400), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func backgroundColor() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemRed.cgColor, UIColor.systemBlue.cgColor]
        self.view.layer.addSublayer(layer)
    }
    
    func question() {
        self.label.frame = CGRect(x: 10, y: 80, width: 500, height: 30)
        self.label.text = "SAY MY NAME"
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

extension StartViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answers", for: indexPath)
//        var content = cell.defaultContentConfiguration()
//        content.text = arrayTest[indexPath.row]
//        cell.contentConfiguration = content
        cell.textLabel?.text = arrayTest[indexPath.row]
        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
            case 0:
            label.text = "Are you dumb?"
            case 1:
            label.text = "OMG, REALLY?"
            case 2:
            label.text = "What do we have here, a fucking comedian?"
            case 3 :
            label.text = "You're God damn right"
            default:
            print("study and hardcode and you will succseed")
                }
        if indexPath.row == 3 {
            integer += 1
            count.text = String(integer)
        }
        else if indexPath.row != 3 {
            integer -= 1
            count.text = String(integer)
            if integer < 0 {
                self.count.text = "Game Over"
                self.tableView.isHidden = true
                
            }
        }
        }
}


