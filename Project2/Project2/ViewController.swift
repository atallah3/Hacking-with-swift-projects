//
//  ViewController.swift
//  Project2
//
//  Created by Abd Elrahman Atallah on 07/11/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TButton: UIButton!
    @IBOutlet var CButton: UIButton!
    @IBOutlet var BButon: UIButton!
    @IBOutlet var scoreCounter: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var currentQues = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TButton.layer.borderWidth = 1
        CButton.layer.borderWidth = 1
        BButon.layer.borderWidth = 1
        
        TButton.layer.borderColor =  UIColor.lightGray.cgColor
        CButton.layer.borderColor =  UIColor.lightGray.cgColor
        BButon.layer.borderColor =  UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
   
        askQuestion()
    }
    func askQuestion (action : UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        TButton.setImage(UIImage(named: countries[0]), for: .normal)
        CButton.setImage(UIImage(named: countries[1]), for: .normal)
        BButon.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        var title : String
        currentQues += 1
        
        if currentQues == 10 {
            let ac = UIAlertController(title: "DONEEEEEEEE", message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac,animated: true)
            score = 0
        }else{
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
                scoreCounter.text = String(score)
                
                let ac = UIAlertController(title: title, message: "Your score is \(score) ", preferredStyle: .alert)
                
                
                ac.addAction(UIAlertAction(title: "Continue", style: .default,handler: askQuestion))
                
                present(ac, animated: true)
                
            }else{
                title = "Wrong"
                score -= 1
                scoreCounter.text = String(score)
                
                let ac = UIAlertController(title: title, message: "Your score is \(score) \n Wrong! That’s the flag of \(countries[sender.tag].uppercased())", preferredStyle: .alert)
                
                
                ac.addAction(UIAlertAction(title: "Continue", style: .default,handler: askQuestion))
                
                present(ac, animated: true)
            }
            
        }
    }
    
}

