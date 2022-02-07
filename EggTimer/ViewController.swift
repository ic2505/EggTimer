//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var secondsRemaining = 60 // initialize with random value
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]! // reassign actual time
        
        // Timer init: updates every 1.0 seconds, repeats every second, selector needs a function name to call every second. To call this function we need @objc because its remnant from objective C Times. Will be clarified later.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        }
        else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
    
    

    
}


