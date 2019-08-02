//
//  TaskOneController.swift
//  imperfection
//
//  Created by GWC2 on 7/31/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit
import AVFoundation
struct problem {
    var p:String
    var ops:[String]
}

class TaskOneController: UIViewController {
    
    var currentP:problem?
    var currentI:Int = 0
    
    var backgroundMusicPlayer: AVAudioPlayer?
    var stop = false
    
    
    @IBOutlet weak var bus: UIImageView!
    
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op1: UIButton!
    @IBOutlet weak var task: UILabel!
    let list:[problem] = [problem(p:  "\nYou realize that your boss is very strict when it comes to work attendance and that you will face some consequences. But that is not what you are worrying about right now. This suspicious man from earlier is approaching closer to you, and eventually stands next to you.\n", ops: [" Walk to the next bus stop ", " Pretend you are calling a friend " ]),
        problem(p: "You feel relieved because your strategy worked! The next bus eventually comes and you get inside right away. When you get inside, you find the closest seat next to the window, keeping out of reach from everyone else. The next thing you realize is someone coming up from behind to sit down next to you, out of other empty seats. It’s that same man again.", ops: [" Get up and move to another seat ", " Stay there "]),
        problem(p: "You notice that this man has been staring at you for as long as you know. The only option is to fool him from leaving this bus. You press the bell for the next stop and see him getting up ready in front of the back door. The bus driver opens the back door and tells the man to get off. He looks at you enraged and you feel relieved that your plan has worked.", ops: [" Call your friend to pick you up at the bus stop ", " Tell your parents about what happened "]),
        problem(p: "You have taken the bus for many years, yet you are disappointed that this experience still happens to girls like you. You are hoping that other people don’t have to go through what you just did, because things could have gone even worse. After all the nerve-racking experience you faced this morning, you realize still have another problem to encounter-- your despiteful boss.", ops: ["exit"])]
    override func viewDidLoad() {
        super.viewDidLoad()
        task.layer.borderColor = UIColor.black.cgColor
        task.layer.borderWidth = 1.0
        task.text = ""
        op1.isHidden = true
        op2.isHidden = true
        
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let path = Bundle.main.path(forResource: "bus.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.play()
        } catch {
            print(" couldn't load file :(")
        }

        UIView.animate(withDuration: 3, animations: {
            self.bus.transform = self.bus.transform.translatedBy(x: 300.0, y: 0)
        })
        setProblem()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        op1.isHidden = false
        if currentP?.ops.count == 2{
            op2.isHidden = false
        }
    }

    @IBAction func next(_ sender: Any) {
        nextProblem()
        
        op1.isHidden = true
        op2.isHidden = true
    }
    @IBAction func next1(_ sender: Any) {
        nextProblem()
        
        op1.isHidden = true
        op2.isHidden = true
    }
    
    
    func nextProblem(){
        currentI += 1
        setProblem()
    }
    
    func setProblem(){
        if currentI < list.count{
            currentP = list[currentI]
            task.animation(Message: currentP!.p, myLabel: task)
            op1.setTitle(currentP?.ops[0], for: .normal)
            print(list[currentI].ops.count)
            if list[currentI].ops.count == 2{
                op2.setTitle(currentP?.ops[1], for: .normal)
            }
        }else{
            performSegue(withIdentifier: "nextTask", sender: self)
            backgroundMusicPlayer?.stop()
        }
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
