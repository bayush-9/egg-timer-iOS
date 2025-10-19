//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft":3, "Medium":7, "Hard":12];
    var time = 0;
    var timer = Timer();
    var totalTime = 60;
    var player = AVAudioPlayer();

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var appTitle: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!;
        appTitle.text = "How do you like your eggs";
        timer.invalidate();
        totalTime=eggTimes[hardness]!;
        time = eggTimes[hardness]!;
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if time > 0 {
            print("\(time)")
            time -= 1
            progressView.progress = Float(time)/Float(totalTime);
        } else {
            timer.invalidate();
            appTitle.text = "Eggs are done my friend!";
            progressView.progress = 1;
            guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
            player = try! AVAudioPlayer(contentsOf: url);
            player.play()
        }
    }
    
    
}
