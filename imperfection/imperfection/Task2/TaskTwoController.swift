//
//  TaskTwoController.swift
//  imperfection
//
//  Created by GWC2 on 8/1/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit

import AVFoundation

class TaskTwoController: UIViewController {
    
    var currentP:problem?
    var currentI:Int = 0

    @IBOutlet weak var task: UILabel!
    
    var backgroundMusicPlayer: AVAudioPlayer?
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op1: UIButton!
    let list:[problem] = [problem(p:  "\"Good Morning, there\", said someone from behind. That sound seems familiar, but it didn’t seem pleasant.\"Yeah you, who came in 15 minutes late just now.\", Mr. K continues. \"You know what the rules are in this workplace, Ms. Suzy. Don’t you?\"", ops: [" Explain to him everything ", " Apologize " ]),
                          problem(p: "\"No need to say more. Now, to repay what you just did, you will work overtime for this whole week. Then, we can call it a tie.\", Mr. K said.\"Bu-- but Mr. K-- \" Before you could say anything, Mr. K looks toward the door, dumbfounded, \"Good morning, Robert! You see, I don’t like seeing my employees coming in late for work, but I’m aware that this is your first time and I won’t count you up on it.\" he laughs.", ops: [" Tell him it’s not fair ", " Stay quiet "]),
                          problem(p: "You remember that you’ll be arranging a team meeting this afternoon, so that you don’t want to make any more problems with Mr. K. You then proceeded to your deskwork.", ops: [" Stay calm ", " Tell your co-workers what happened "]),
                          problem(p: "It’s 3 p.m. and you’re ready to deliver your meeting to your co-workers. You noticed Mr. K walks into the room. You began presenting your thesis, which you’ve developed for over 3 months. \"You call this a thesis for my company? I knew a supervisor position is not where you are supposed to belong.\" Mr. K mumbles.", ops: [" Speak for yourself ", " Educate him " ]),
    problem(p: "\"Who are you to talk back? You have caused too many problems Ms. Suzy. I’m afraid you’ll cause more. I think it’ll be best for both of us to have you end your job today. Yes, today.\"", ops: [" Walk out of the room ", " Agree to him "]),
    problem(p: "You did the right move. He wasn’t the right boss for you. There’ll be plenty of other jobs that would want you for who you are.", ops: [" Exit "])]
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
        let path = Bundle.main.path(forResource: "office.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.play()
        } catch {
            print(" couldn't load file :(")
        }

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
            performSegue(withIdentifier: "Task3", sender: self)
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

