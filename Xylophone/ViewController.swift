//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    
    var soundName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        soundName = sender.currentTitle!
        playSound(soundWaveName: soundName)
       
        sender.alpha = 0.5 //opacity reduced to 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // opacity  will be changed back to normal after a delay of 0.2 seconds
            sender.alpha = 1
           
        }
    }
    
    func playSound(soundWaveName: String) {
        let url = Bundle.main.url(forResource: soundWaveName, withExtension: "wav")

        player = try! AVAudioPlayer(contentsOf: url!)
        
        player.play()

    }
    
    

}

