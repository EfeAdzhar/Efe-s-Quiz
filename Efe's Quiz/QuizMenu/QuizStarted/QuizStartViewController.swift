//
//  QuizStartViewController.swift
//  Efe's Quiz
//
//  Created by Efe on 19.05.2022.
//

import UIKit

class QuizStartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView()
        // Do any additional setup after loading the view.
    }
    
    func backgroundView() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemGray.cgColor, UIColor.systemPink.cgColor]
        self.view.layer.addSublayer(layer)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
