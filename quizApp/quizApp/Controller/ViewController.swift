//
//  ViewController.swift
//  quizApp
//
//  Created by Kiran Kishore on 13/07/19.
//  Copyright © 2019 CDNS. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var progresBar: UIView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    
   
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       //progressView.isHidden = true
        nextQuestion()
        
     
    }

    
    
    
    @IBAction func answerButton(_ sender: UIButton) {
    
       //progressView.isHidden = false
        if sender.tag == 1 {
          
            pickedAnswer = true
            
        }
        
        else if sender.tag == 2 {
            
            pickedAnswer = false
            
        }
    
    checkAnswer()
    
    questionNumber = questionNumber + 1
    
    nextQuestion()
    updateUI()
        
    }
    
    //FUNCTION TO UPDATE THE QUESTIONS, SCORE/PROGRESS LABELS AFTER EACH BUTTON PRESS
    func updateUI() {
        
        progressLabel.text = "\(questionNumber)/13"
        scoreLabel.text = "Score : \(score)"
        progresBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
    }
    
    //FUNCTION TO LOAD NEXT QUESTION
    func nextQuestion() {
        
        if questionNumber <= 12   {
            questionLabel.text = allQuestions.qList[questionNumber].questionText
            
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "End Of Quiz \nYour Score is \(score)", message: "Do you wish to restart the quiz?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    //FUNCTION TO CHECK ANSWER
    func checkAnswer() {
        
        
        let correctAnswer = allQuestions.qList[questionNumber].answer
        
        if pickedAnswer == correctAnswer {
            
            ProgressHUD.showSuccess("Correct Answer!")
           // print("Right Answer!!!")
            
            score = score + 1
            
        }
        else {
            
            ProgressHUD.showError("Wrong Answer!")
            //print("Wrong Answer!!!")
        }
    }
    
    //FUNCTION TO RESTART QUIZ
    func startOver() {
        
         questionNumber = 0
        score = 0
        nextQuestion()
        
    }
    
    

}

