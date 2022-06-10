//
//  QuizList.swift
//  Efe's Quiz
//
//  Created by Efe on 08.05.2022.
//

import UIKit

class QuizList: UITableViewController {
    
var imageArray = ["political_orientation",
                  "history_knowledge"]
    var quizArray = ["What is your political orientation?",
                     "Historical Knowledge"]
    var descriptionArray =
            ["If you're interested in politics but still you don't know on what side you are, then this quiz is for you!",
            "Knowing History is really important. It's not only interesting but also it helps us to not forget the lessons of the past, but do you know it well? Test youreself with this quiz!"]

    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Quiz")
        super.viewDidLoad()
        backgroundColor()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quizArray.count
    }

    func backgroundColor() {
        let layer = CAGradientLayer()
        layer.frame = self.tableView.bounds
        layer.colors = [UIColor.systemRed.cgColor, UIColor.systemGray.cgColor, UIColor.systemPink.cgColor]
        self.tableView.layer.addSublayer(layer)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Quiz", for: indexPath)
        cell.imageView?.image = UIImage(named: imageArray[indexPath.row])
        cell.textLabel?.text = quizArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let quizes = quizArray[indexPath.row]
        let images = UIImage(named: imageArray[indexPath.row])!
        let descriptions = descriptionArray[indexPath.row]
        let vc = QuizStartViewController(quiz: quizes, image: images, descriptions: descriptions)
        self.present(UINavigationController(rootViewController: vc), animated: true)
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension QuizList : UITableViewCell {
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//}
