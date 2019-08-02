//
//  finalController.swift
//  imperfection
//
//  Created by GWC2 on 8/1/19.
//  Cboxyright © 2019 GWC. All rights reserved.
//

import UIKit
import AVFoundation

class finalController: UIViewController {
    var backgroundMusicPlayer: AVAudioPlayer?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var box: UILabel!
    var currentI = 0
    var text:[String] = ["Good morning Ms. Suzy.  I apologize for being late, the traffic light in the F street was down, so getting here was really hectic.", "Good Morning, Devon. I hope you made it today. Have you finalized the documents for tomorrow’s presentation? Our client will be impressed if we give them our best deal.", "Yes, I have. I will send you the statistics soon. Also, how is the Hackathon event that you arrange going so far?", "Our Hackathon is  going great. More people signed up for the event more than I expected, but we’re still working on reaching out this topic to more diverse communities.", "That’s great Ms. Suzy. Not only is your company doing amazing, but you are also contributing back to the community… I hope I can be like you too, but first I need to work on my tardy.", "No worries Devon, just make sure you call if anything like this ever happens again. We are all humans after all."]
    
    @IBOutlet weak var box1: UIImageView!
    @IBOutlet weak var box2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setProblem()
        box1.isHidden = true
        let path = Bundle.main.path(forResource: "doctor.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.play()
        } catch {
            print(" couldn't load file :(")
        }

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nextProblem()
    }

    func nextProblem(){
        currentI += 1
        setProblem()
    }
    
    func setProblem(){
        if currentI < text.count{
            box.animation(Message: text[currentI], myLabel: box)
            if currentI % 2 != 0{
                box2.isHidden = true
                box1.isHidden = false
            }else{
                box1.isHidden = true
                box2.isHidden = false
            }
        }else{
            performSegue(withIdentifier: "final", sender: self)
            backgroundMusicPlayer?.stop()
        }
    }

}
