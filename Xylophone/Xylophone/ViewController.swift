//
//  ViewController.swift
//  Xylophone
//
//  Created by Melih Başayiğit on 18.08.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        playSound(sender.titleLabel?.text)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    func playSound(_ letter: String?) {
        
        if let resource = letter {
            guard let url = Bundle.main.url(forResource: resource, withExtension: "wav") else {
                fatalError("Error")
            }
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
                guard let player = player
                else {
                    fatalError()
                }
                player.play()
            } catch {
                print("Error !! Player init error.")
            }
        }
        
    }
    
}

