import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    var countries = [String]()
    
    var score = 0
    var correctAnswer = 0
    
    var questionsCount = 10
    var currentQuestion = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .done, target: self, action: #selector(showUserScore))
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct!"
            score += 1
        } else {
            title = "Wrong!"
        }
        
        if currentQuestion == questionsCount {
            let alert = UIAlertController(title: title, message: "Question \(currentQuestion)/\(questionsCount)\n Your score is \(score)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))
            
            score = 0
            currentQuestion = 1
            
            present(alert, animated: true)
            
        } else {
            let message = "Question \(currentQuestion)/\(questionsCount)"
            let chosenFlag = title == "Wrong!" ? "\(message)\n It's the \(countries[sender.tag].uppercased()) flag" : message
            
            let alert = UIAlertController(title: title, message: chosenFlag, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Next question", style: .default, handler: askQuestion))
            present(alert, animated: true)
            
            currentQuestion += 1
        }
    }
    
    private func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "Where is the \(countries[correctAnswer].uppercased()) flag?"
    }
    
    @objc private func showUserScore() {
        let alert = UIAlertController(title: "Your score", message: "Current score is \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}

