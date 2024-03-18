//
//  ViewController.swift
//  Counter
//
//  Created by Sergei Volotka on 18.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyOfChangesTextView: UITextView!
    @IBOutlet weak var counterUILabel: UILabel!
    private var counter: Int = 0
    private var formatter = DateFormatter()
    private var dateText = ""
        
    
    @IBOutlet weak var addUIButton: UIButton!
    
    @IBOutlet weak var subtractUIButton: UIButton!
    @IBOutlet weak var resetUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyOfChangesTextView.text = "История изменений:\n"
        formatter.dateFormat = "dd/MM/yyyy' 'HH:mm:ss"
        
        // counterUILabel.text = counterText
        // Do any additional setup after loading the view.
    }

    @IBAction func addNumber(_ sender: Any) {
        var currentData = Date()
        dateText = formatter.string(from: currentData)
        counter += 1
        counterUILabel.text = "Значение счётчика: \(counter)"
        historyOfChangesTextView.text += "\(dateText): значение изменено на +1\n"
    }
    
    @IBAction func subtractNumber(_ sender: Any) {
         var currentData = Date()
        dateText = formatter.string(from: currentData)
        counter -= 1
        if counter < 0 {
            counter = 0
            historyOfChangesTextView.text += "\(dateText): попытка уменьшить значение счётчика ниже 0\n"
        } else {
            historyOfChangesTextView.text += "\(dateText): значение изменено на -1\n"
        }
        counterUILabel.text = "Значение счётчика: \(counter)"
        }
    
    @IBAction func resetCounter(_ sender: Any) {
         var currentData = Date()
        dateText = formatter.string(from: currentData)
        counter = 0
        counterUILabel.text = "Значение счётчика: \(counter)"
        historyOfChangesTextView.text += "\(dateText): значение сброшено\n"
    }
}

