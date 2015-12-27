//
//  PlaySoundsViewController.swift
//  Pitch-Perfect
//
//  Created by Sudheer Keshav Bhat on 21/12/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var player:AVAudioPlayer!
    
    var receivedAudio:RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    
    var audioFile:AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()
        player = try? AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        player.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = try? AVAudioFile(forReading: receivedAudio.filePathUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playFast(sender: UIButton) {
        play(1.5)
    }

    @IBAction func playSlowly(sender: UIButton) {
        play(0.5)
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
        player.stop()
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    func playAudioWithVariablePitch(pitch:Float){
        player.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
    }
    
    func play(rate:Float){
        player.stop()
        player.currentTime = 0.0
        player.rate = rate
        player.play()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
