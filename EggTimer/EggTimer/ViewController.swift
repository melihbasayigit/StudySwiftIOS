//
//  ViewController.swift
//  EggTimer
//
//  Created by Melih Başayiğit on 19.08.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft":15, "Medium":30, "Hard":60]
    let soundName = "alarm_sound"
    let soundExt = "mp3"
    var timer = Timer()
    var audioPlayer: AVAudioPlayer?
    var totalTime = 0
    var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "What is your egg hardness choice ??"
        progressBar.setProgress(0.0, animated: true)
    }
    
    @IBAction func clickAnyHardness(_ sender: UIButton) {
        
        timer.invalidate()
        
        if let hardness = sender.titleLabel?.text, let _totalTime = eggTimes[hardness] {
            totalTime = _totalTime
            textLabel.text = hardness
            progressBar.setProgress(0.0, animated: true)
            secondsPassed = 0
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        print(totalTime)
        
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let progress = Float(secondsPassed) / Float(totalTime)
            progressBar.setProgress(progress, animated: true)
        } else {
            timer.invalidate()
            textLabel.text = "DONE!"
            
            guard let url = Bundle.main.url(forResource: soundName, withExtension: soundExt)
            else {
                fatalError("Error Sound URL doesn't exist correctly")
            }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
            catch {
                print("Error Catching..")
            }
        }
    }
}

