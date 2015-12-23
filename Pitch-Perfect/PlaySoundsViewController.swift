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

    override func viewDidLoad() {
        super.viewDidLoad()
        player = try? AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        player.enableRate = true
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
