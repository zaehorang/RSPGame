//
//  ViewController.swift
//  RSPGame
//
//  Created by zaehorang on 2023/07/26.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLable: UILabel!
    
    @IBOutlet weak var comChoiceLable: UILabel!
    @IBOutlet weak var myChoiceLable: UILabel!
    
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var myImage: UIImageView!
    var myChoice: Rps = .rock
    var comChoice: Rps = .rock
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        computerImage.image = #imageLiteral(resourceName: "ready")
        myImage.image = UIImage(named: "ready.png")
        
        comChoiceLable.text = "준비"
        myChoiceLable.text = "준비"
        
    }

    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "가위":
            myChoice = .scissors
        case "바위":
            myChoice = .rock
        case "보":
            myChoice = .paper
        default:
            break
        }
    }
    
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        computerImage.image = #imageLiteral(resourceName: "ready")
        myImage.image = UIImage(named: "ready.png")
        
        comChoiceLable.text = "준비"
        myChoiceLable.text = "준비"
        
        mainLable.text = "선택하세요"
    }
    
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        if let choice = Rps(rawValue: Int.random(in: 0...2)) {
            comChoice = choice
            }
        
        switch comChoice {
        case .scissors:
            comChoiceLable.text = "가위"
            computerImage.image = #imageLiteral(resourceName: "scissors")
        case .rock:
            comChoiceLable.text = "바위"
            computerImage.image = #imageLiteral(resourceName: "rock")
        case .paper:
            comChoiceLable.text = "보"
            computerImage.image = #imageLiteral(resourceName: "paper")
        }
        
        
        switch myChoice {
        case .scissors:
            myChoiceLable.text = "가위"
            myImage.image = #imageLiteral(resourceName: "scissors")
        case .rock:
            myChoiceLable.text = "바위"
            myImage.image = #imageLiteral(resourceName: "rock")
        case .paper:
            myChoiceLable.text = "보"
            myImage.image = #imageLiteral(resourceName: "paper")
        }
        
        if myChoice == comChoice {
            mainLable.text = "비겼다"
        } else if myChoice == .paper && comChoice == .rock {
            mainLable.text = "이겼다"
        } else if myChoice == .scissors && comChoice == .paper {
            mainLable.text = "이겼다"
        } else if myChoice == .rock && comChoice == .scissors {
            mainLable.text = "이겼다"
        } else {
            mainLable.text = "졌다"
        }
        
        
    }
    
}

