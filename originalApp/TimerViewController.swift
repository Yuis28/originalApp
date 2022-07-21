//
//  TimerViewController.swift
//  originalApp
//
//  Created by 杉田優衣 on 2022/07/16.
//

import UIKit

class TimerViewController: UIViewController {
    var startTime: TimeInterval? = nil
    var timer : Timer!
    var milsec = 0
    
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(_ sender: Any) {
        //timer.invalidate()
        //self.startTime = Date.timeIntervalSinceReferenceDate
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerCounter(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounter(_ timer:Timer) {
        //guard let startTime = self.startTime else { return }
        //let time = Date.timeIntervalSinceReferenceDate - startTime
        milsec += 1
        let second = milsec / 100
        let min = Int(second / 60)
        let sec = Int(second - min * 60)
        let msec = Int(milsec - sec * 100 )
        self.timerLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        self.startTime = nil
        self.timerLabel.text = "00:00:00"
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
