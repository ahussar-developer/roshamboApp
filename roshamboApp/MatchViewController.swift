//
//  MatchViewController.swift
//  roshamboApp
//
//  Created by Alex Hussar on 1/28/20.
//  Copyright © 2020 AlexHussar. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    //MARK: Generate Computer's Play
    func randomValue() -> Int {
        //generate int from 1 to 3
        let randomValue = 1 + arc4random() % 3
        
        //return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    enum plays:Int {
        case rock = 1
        case paper
        case scissors
    }

    //MARK: Actions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "rock"{
            let controller = segue.destination as! OutcomeViewController
            controller.userValue = plays.rock.rawValue
            controller.compValue = randomValue()
            
        } else if segue.identifier == "paper"{
            let controller = segue.destination as! OutcomeViewController
            controller.userValue = plays.paper.rawValue
            controller.compValue = randomValue()
            
        } else if segue.identifier == "scissors"{
            let controller = segue.destination as! OutcomeViewController
            controller.userValue = plays.scissors.rawValue
            controller.compValue = randomValue()
            
        }
    }


}

