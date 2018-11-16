//
//  ViewController.swift
//  GuessGameApp
//
//  Created by Mohamed Alaa El-Din on 11/13/18.
//  Copyright © 2018 Mohamed Alaa El-Din. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    ///
    
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    
    var contries = [String]()
    var correctAnswer = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1.layer.borderWidth = 1
        btn2.layer.borderWidth = 1
        btn3.layer.borderWidth = 1
        
        btn1.layer.borderColor = UIColor.lightGray.cgColor
        btn2.layer.borderColor = UIColor.lightGray.cgColor
        btn3.layer.borderColor = UIColor.lightGray.cgColor
        
        contries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
//    func askQuestion() {
//        button1.setImage(UIImage(named: countries[0]), for: .normal)
//        button2.setImage(UIImage(named: countries[1]), for: .normal)
//        button3.setImage(UIImage(named: countries[2]), for: .normal)
//    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        contries.shuffle()
        btn1.setImage(UIImage(named: contries[0]), for: .normal)
        btn2.setImage(UIImage(named: contries[1]), for: .normal)
        btn3.setImage(UIImage(named: contries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        
        title = "What Is The Flag Of \(contries[correctAnswer].uppercased()) ?"
    }

    @IBAction func postAnswer(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            if score != 0 {
                score -= 1
            }
            
        }
            
        let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alertController, animated: true)
    }
}

