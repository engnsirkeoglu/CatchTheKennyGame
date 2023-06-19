//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Engin Sirkeoğlu on 18.06.2023.
//

import UIKit

class ViewController: UIViewController {
    // Score Variable
    
    var score = 0
    
    // Label
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    // Image View
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
        
        kennyImageView1.isUserInteractionEnabled = true
        kennyImageView2.isUserInteractionEnabled = true
        kennyImageView3.isUserInteractionEnabled = true
        kennyImageView4.isUserInteractionEnabled = true
        kennyImageView5.isUserInteractionEnabled = true
        kennyImageView6.isUserInteractionEnabled = true
        kennyImageView7.isUserInteractionEnabled = true
        kennyImageView8.isUserInteractionEnabled = true
        kennyImageView9.isUserInteractionEnabled = true
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let tapGestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kennyImageView1.addGestureRecognizer(tapGestureRecognizer1)
        kennyImageView2.addGestureRecognizer(tapGestureRecognizer2)
        kennyImageView3.addGestureRecognizer(tapGestureRecognizer3)
        kennyImageView4.addGestureRecognizer(tapGestureRecognizer4)
        kennyImageView5.addGestureRecognizer(tapGestureRecognizer5)
        kennyImageView6.addGestureRecognizer(tapGestureRecognizer6)
        kennyImageView7.addGestureRecognizer(tapGestureRecognizer7)
        kennyImageView8.addGestureRecognizer(tapGestureRecognizer8)
        kennyImageView9.addGestureRecognizer(tapGestureRecognizer9)
       
       
    }
    
    // Function to increase score
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    
}

