//
//  ViewController.swift
//  birdcall
//
//  Created by montserratloan on 2/2/18.
//  Copyright © 2018 Juan Suarez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var awsomeImage: UIImageView!
    
    @IBOutlet weak var soundSwitchPressed: UISwitch!
    
    @IBOutlet weak var showMessage: UIButton!
    
    var awsomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    var lastSound = -1
    let numberOfImages = 7
    let numberOfSounds = 4
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        print("*** view Did Load" )
        
    }
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset (name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: file \(soundName) couldn't be played as a sound.")
            }
        } else {
            print("ERROR: data in \(soundName) couldn't be played as a sound.")
                
            }
        
    }
    func nonReapeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
   // ACTIONS
    
   
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitchPressed.isOn && soundNumber != -1 {
            if lastSound != -1 {
                awsomePlayer.stop()
                
            }
        }
    }
    
    @IBAction func showMessage(_ sender: UIButton) {
        
        let message = ["you are Fantastic!!!",
                       "you are great!",
                       "you are amazing!",
                       "when the genius Bar needs help they call you!",
                       "YOU brighten my Day!"]
        
        index = nonReapeatingRandom(lastNumber: index, maxValue: message.count)
        messageLabel.text = message[index]
        
        awsomeImage.isHidden = false
        
        imageNumber = nonReapeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awsomeImage.image = UIImage(named: "image\(imageNumber)")
        
        if soundSwitchPressed.isOn {
            soundNumber = nonReapeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awsomePlayer)
        }
    }
    


}

