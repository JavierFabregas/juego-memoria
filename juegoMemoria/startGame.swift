// pagina inicial

import UIKit
var difficulty: Int = 9

class startGame: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func difficultyEasy(_ sender: Any) {
        difficulty = 3
    }
    
    @IBAction func difficultyMedium(_ sender: Any) {
        difficulty = 6
    }
    
    @IBAction func difficultyHard(_ sender: Any) {
        difficulty = 9
    }
}
