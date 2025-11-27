import Foundation
import UIKit

protocol TextualRepresentation {
    var textualDescription: String { get }
}

extension Array: TextualRepresentation where Element: TextualRepresentation {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ",") + "]"
    }
}

class DiceGame: TextualRepresentation {
    let number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    var textualDescription: String {
        return "Dice game \(number)"
    }
}

let diceGame1 = DiceGame(number: 3)
let diceGame2 = DiceGame(number: 6)

let games = [diceGame1, diceGame2]
print(games.textualDescription)

// [Dice game 3,Dice game 6]
