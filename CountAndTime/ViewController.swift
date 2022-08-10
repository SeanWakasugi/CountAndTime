//
//  ViewController.swift
//  CountAndTime
//
//  Created by s.wakasugi on 2022/08/10.
//

import UIKit

class CountAndTimeViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeButton: UIButton!
    
    var count: Int = 0 {
        didSet {
            DispatchQueue.main.async {
                self.countLabel.text = String(self.count)
            }
        }
    }
    
    var isTimerOn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = String(count)
        setTimeLabel()
    }
    
    @IBAction func didPressCountButton(_ sender: UIButton) {
        isTimerOn = !isTimerOn
        if isTimerOn {
            sender.setTitle("Stop", for: .normal)
            countUp()
        } else {
            sender.setTitle("Start", for: .normal)
        }
    }
    
    @IBAction func didPressTimeButton(_ sender: UIButton) {
        setTimeLabel()
    }
    
    func countUp() {
        DispatchQueue.global().async {
            while self.isTimerOn {
                self.count = self.count + 1
                Thread.sleep(forTimeInterval: 0.1)
            }
        }
    }
    
    func setTimeLabel() {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        timeLabel.text = formatter.string(from: Date())
    }
}

