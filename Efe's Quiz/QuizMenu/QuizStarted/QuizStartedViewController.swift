//
//  QuizStartedViewController.swift
//  Efe's Quiz
//
//  Created by Efe on 30.05.2022.
//

//import UIKit
//
//class QuizStartedViewController: UIViewController {
//
//    @IBOutlet weak var tableView: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        backgroundColor()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//    }
//
//    func backgroundColor() {
//        let layer = CAGradientLayer()
//        layer.frame = self.view.bounds
//        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemRed.cgColor, UIColor.systemBlue.cgColor]
//        self.view.layer.addSublayer(layer)
//    }
//}
//
//extension QuizStartedViewController : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        return cell
//
//    }
//
//
//    }
