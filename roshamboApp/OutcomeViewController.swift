//
//  OutcomeViewController.swift
//  roshamboApp
//
//  Created by Alex Hussar on 1/28/20.
//  Copyright © 2020 AlexHussar. All rights reserved.
//

import UIKit

class OutcomeViewController: UIViewController {
    
    //MARK: Properties
    
    var userValue: Int?
    var compValue: Int?
    
    enum results:String {
        case ScissorsCutPaper = "ScissorsCutPaper"
        case itsATie = "itsATie"
        case RockCrushesScissors = "RockCrushesScissors"
        case PaperCoversRock = "PaperCoversRock"
    }

    //MARK: Outlets
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var outputLabel: UILabel!
    
    //MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        if let userValue = self.userValue{
            print(userValue)
            if let compValue = self.compValue{
                print(compValue)
                let winner = determineWinner(userValue: userValue, compValue: compValue)
                self.outputLabel.text = winner.1
                self.resultImage.image = UIImage(named: winner.0)
                self.resultImage.alpha = 1.0
            }
        } else {
            self.resultImage.image = nil
        }
        
    }
    
    func determineWinner(userValue: Int, compValue: Int) -> (String, String) {
        //rock = 1, paper = 2, scissors = 3
        //2 beats 1
        //1 beats 3
        //3 beats 2
        var result = ""
        var output = ""
        
        if userValue == compValue{
            result = results.itsATie.rawValue
            output = "Looks like we have a tie!"
        }
        
        
        if userValue == 1 { //rock
            if compValue == 2 {
                result = results.PaperCoversRock.rawValue
                output = "Paper Covers Rock. You Lose!"
            } else if compValue == 3{
                result = results.RockCrushesScissors.rawValue
                output = "Rock Smashes Scissors. You Win!"
            }
        } else if userValue == 2 { //paper
            if compValue == 1 {
                result = results.PaperCoversRock.rawValue
                output = "Paper Covers Rock. You Win!"
            } else if compValue == 3{
                result = results.ScissorsCutPaper.rawValue
                output = "Scissors Cuts Paper. You Lose!"
            }
        } else if userValue == 3{ // scissors
            if compValue == 1 {
                result = results.RockCrushesScissors.rawValue
                output = "Rock Smashes Scissors. You Lose!"
            } else if compValue == 2{
                result = results.ScissorsCutPaper.rawValue
                output = "Scissors Cuts Paper. You Win!"
            }
        }
        return (result,output)
    }
    @IBAction func playAgain(_ sender: Any) {
        dismiss()
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
