//
//  ThankViewController.swift
//  imperfection
//
//  Created by GWC2 on 8/1/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit
import AVFoundation

class ThankViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
     var backgroundMusicPlayer: AVAudioPlayer?
    @objc func onTimerEvent(timer: Timer) {
        self.imageView.isHidden = !self.imageView.isHidden
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "intro.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.play()
        } catch {
            print(" couldn't load file :(")
        }
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(onTimerEvent(timer:)), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        backgroundMusicPlayer?.stop()
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
