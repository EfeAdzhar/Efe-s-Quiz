//
//  QuizCollectionViewController.swift
//  Efe's Quiz
//
//  Created by Efe on 18.06.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class QuizCollectionViewController: UICollectionViewController, QuizLists {
    
    var imageArray = ["political_orientation",
                      "history_knowledge"]
        var quizArray = ["What is your political orientation?",
                         "Historical Knowledge"]
        var descriptionArray =
                ["If you're interested in politics but still you don't know on what side you are, then this quiz is for you!",
                "Knowing History is really important. It's not only interesting but also it helps us to not forget the lessons of the past, but do you know it well? Test youreself with this quiz!"]


    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        cell.title = quizArray[indexPath.row]
//        cell.imageView.image
        return cell
    }

   
}
