//
//  File.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 19/02/25.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var playGame:Bool = false
    
    @Published var sceneGame = "scene1"
    @Published var sceneCounter = 1
    
    @Published var fibonacciNumbers = [0, 1, 1, 2, 3, 5, 8, 13]
    @Published var rotationCicle: Double = 0
    
    @Published var prior: Int = 6
    @Published var preceding: Int = 5
    
    
    @Published var score: Int = 0
    @Published var highScore: Int = UserDefaults.standard.integer(forKey: "highScore")
    
    @Published var nicknailImage = "nicknail"
    
    @Published var count: Int = 2
    @Published var button1 = 1
    @Published var button2 = 2
    @Published var button3 = 3
    
    func randomizeButtons() {
        let correctAnswer = fibonacciNumbers[count]
        var randomButtons = Set<Int>()
        
        randomButtons.insert(correctAnswer)
        
        while randomButtons.count < 3 {
            let randomValue = Int.random(in: correctAnswer...(correctAnswer + 10))
            randomButtons.insert(randomValue)
        }
        
        let randomButtonsArray = Array(randomButtons).shuffled()
        
        button1 = randomButtonsArray[0]
        button2 = randomButtonsArray[1]
        button3 = randomButtonsArray[2]
    }
    
    func checkResult(answer: Int) -> Bool {
        if answer == fibonacciNumbers[count] {
            return true
        } else {
            return false
        }
    }
    
    func rotateScreen() {
        print("chamou a rotacao")
        rotationCicle -= 45
        
        let calc = fibonacciNumbers[prior] + fibonacciNumbers[preceding]
        preceding = prior
        
        if prior == 7 {
            prior = 0
        } else {
            prior += 1
        }
        fibonacciNumbers[prior] = calc
    }
    
    func updateHighScore(newHighScore: Int) {
        UserDefaults.standard.set(newHighScore, forKey: "highScore")
        highScore = newHighScore
    }
    
    func generateScene(operation: String) {
        print("chegou aqui")
        
        if sceneCounter != 0 {
            if operation == "add" {
                sceneCounter += 1
            } else if operation == "subtract" {
                sceneCounter -= 1
            } else if operation == "returnall" {
                sceneCounter = 1
            }else if operation == "nextall" {
                sceneCounter = 17
            }
            sceneGame = "scene\(sceneCounter)"
        }
    }
    
}
