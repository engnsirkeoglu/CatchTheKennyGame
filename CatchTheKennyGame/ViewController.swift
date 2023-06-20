//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Engin Sirkeoğlu on 18.06.2023.
//

import UIKit

class ViewController: UIViewController {
    // Variables
    var score = 0
    var time =  0
    var highscore = 0
    var timer = Timer()
    var hideTimer = Timer()
    var kennyArray = [UIImageView]()
    
    
    // Views
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
  
    @IBOutlet weak var kennyImageView1: UIImageView!
    @IBOutlet weak var kennyImageView2: UIImageView!
    @IBOutlet weak var kennyImageView3: UIImageView!
    @IBOutlet weak var kennyImageView4: UIImageView!
    @IBOutlet weak var kennyImageView5: UIImageView!
    @IBOutlet weak var kennyImageView6: UIImageView!
    @IBOutlet weak var kennyImageView7: UIImageView!
    @IBOutlet weak var kennyImageView8: UIImageView!
    @IBOutlet weak var kennyImageView9: UIImageView!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score)"
        
        // Images
        kennyImageView1.isUserInteractionEnabled = true
        kennyImageView2.isUserInteractionEnabled = true
        kennyImageView3.isUserInteractionEnabled = true
        kennyImageView4.isUserInteractionEnabled = true
        kennyImageView5.isUserInteractionEnabled = true
        kennyImageView6.isUserInteractionEnabled = true
        kennyImageView7.isUserInteractionEnabled = true
        kennyImageView8.isUserInteractionEnabled = true
        kennyImageView9.isUserInteractionEnabled = true
        
        // TapGestureRecognizer
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        // Add tapGestureRecognizer to images
        kennyImageView1.addGestureRecognizer(tapGestureRecognizer1)
        kennyImageView2.addGestureRecognizer(tapGestureRecognizer2)
        kennyImageView3.addGestureRecognizer(tapGestureRecognizer3)
        kennyImageView4.addGestureRecognizer(tapGestureRecognizer4)
        kennyImageView5.addGestureRecognizer(tapGestureRecognizer5)
        kennyImageView6.addGestureRecognizer(tapGestureRecognizer6)
        kennyImageView7.addGestureRecognizer(tapGestureRecognizer7)
        kennyImageView8.addGestureRecognizer(tapGestureRecognizer8)
        kennyImageView9.addGestureRecognizer(tapGestureRecognizer9)
        
        
        kennyArray = [kennyImageView1,kennyImageView2,kennyImageView3,kennyImageView4,kennyImageView5,kennyImageView6,kennyImageView7,kennyImageView8,kennyImageView9]
        
        hideKenny()
        
        // Timers
        
        time = 10
        timeLabel.text = "\(time)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomKenny), userInfo: nil, repeats: true)
        
        let storedHighScore = UserDefaults.standard.value(forKey: "highScore")
        if storedHighScore == nil{
            highscore = 0
            highScoreLabel.text = "Highscore: \(highscore)"
        }
        
        if let newScore = storedHighScore as? Int{
            print("girdi buraya")
            highscore = newScore
            highScoreLabel.text = "Highscore: \(highscore)"
        }
        
       
    }
    
    // Function to increase score
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    // Count down to Time
    @objc func countDown(){
        if time <= 0{
            
            // turn of timers
            timer.invalidate()
            hideTimer.invalidate()
            
            // hides kennys on screen when time is up
            hideKenny()
            
            // Highscore
            
            if score > highscore {
                highscore = score
                highScoreLabel.text = "Highscore: \(highscore)"
                UserDefaults.standard.set(highscore, forKey: "highScore")
            }
            
            // Alert
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel,handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: .default,handler: replayButtonHandler)
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true)
        }else{
            time -= 1
            timeLabel.text = "\(time)"
        }
        
    }
    

    // Method that works when pressed again
    func replayButtonHandler(action:UIAlertAction){
        time = 10
        timeLabel.text = "\(time)"
        
        score = 0
        scoreLabel.text = "Score: \(score)"

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomKenny), userInfo: nil, repeats: true)
    }
    
    // Hide kenny
     func hideKenny(){
        for kenny in kennyArray {
            kenny.isHidden = true
        }
    }
    
    // Show Kenny
    @objc func showRandomKenny(){
        hideKenny()
        let randomNumber = Int(arc4random_uniform(UInt32(kennyArray.count-1)))
        kennyArray[randomNumber].isHidden = false
    }
    

}

