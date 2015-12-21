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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let path = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            //print(path)
            let url = NSURL.fileURLWithPath(path)
            player = AVAudioPlayer(contentsOfURL: url, error: nil)
            player.enableRate = true
        }else{
            print("Filepath is empty")
        }
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
