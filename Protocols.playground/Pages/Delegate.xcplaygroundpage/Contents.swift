import Foundation

// ======= DELEGATION PATTERN USING PROTOCOL ==================

protocol GameDelegate: AnyObject {
    func gameDidStart()
    func gameDidEnd()
    func gameDidUpdateScore(score: Int)
}

class DiceGame {
    
    weak var delegate: GameDelegate?
    
    func startGame() {
        delegate?.gameDidStart()
    }
    
    func endGame() {
        delegate?.gameDidEnd()
    }
    
    func updateScore(_ score: Int) {
        delegate?.gameDidUpdateScore(score: score)
    }
}

class GameController: GameDelegate {
    
    func gameDidStart() {
        print("Dice game has started")
    }
    
    func gameDidEnd() {
        print("Dice game has ended")
    }
    
    func gameDidUpdateScore(score: Int) {
        print("Dice game updated with score : \(score)")
    }
    
    
}

let diceGameController = GameController()
let diceGame = DiceGame()
diceGame.delegate = diceGameController
diceGame.startGame()
diceGame.endGame()
diceGame.updateScore(100)

/*
 OUTPUT :-
 Dice game has started
 Dice game has ended
 Dice game updated with score : 100
 */
