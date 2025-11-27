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
    
    func updateScore() {
        delegate?.gameDidUpdateScore(score: 100)
    }
}

class GameController: GameDelegate {
    
    init() {
        let diceGame = DiceGame()
        diceGame.delegate = self
    }
    
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
