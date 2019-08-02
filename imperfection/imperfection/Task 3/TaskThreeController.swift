//
//  TaskThreeController.swift
//  imperfection
//
//  Created by GWC2 on 8/1/19.
//  Copyright © 2019 GWC. All rights reserved.


import UIKit


import AVFoundation

class TaskThreeController: UIViewController {
    
    var currentP:problem?
    var currentI:Int = 0
    var backgroundMusicPlayer: AVAudioPlayer?
    @IBOutlet weak var op1: UIButton!
    @IBOutlet weak var task: UILabel!
    @IBOutlet weak var op2: UIButton!
    let list:[problem] = [problem(p:  "As you are walking you realize the man from earlier is across the street, and for you to get to the doctors office you have to cross.You are anxious that if you cross that he might try to do something. ", ops: [" Call the police ", " Ask someone else to call the police for you " ]),
                          problem(p: "When the police arrive they thank you. The suspicious guy had escaped from prison, he was a predator, as you walk into the doctor's office you realize no one is there.", ops: [" Wait 5 minutes and then call out for someone ", " Call out for someone right away "]),
                          problem(p: "Once you called out for the doctor he finally comes out of his office, he looks you up and down with disgust and replies to you with a very angry and disgusted tone of voice, \"Yes miss, may I help you?\"", ops: [" Greet him ", " Explain your situation "]),
                          problem(p: "You ask the doctor is there is any opening for being an assistant or becoming a receptionist. You even ask if there is any way you can be a nurse. He begins to smirk, you are utterly confused, then the doctor breaks out into a whole laughing session and you wonder what you did wrong.", ops: [" Sir, is there something I said?  ", "  Sir, that's very impolite of you. " ]),
                          problem(p: "He quickly states that he doesn't hire females, as you reply to his statement  you begin to think what you did wrong, why you wouldn't be able to get this job, you begin to doubt yourself.", ops: [" Give him a stare ", " Ask him why "]),
                          problem(p: "You were disgusted and furious that he would have the nerve to say that in front of you face,  you felt pain strain in your chest but that wasn't going to stop from giving the doctor a peace of your mind in what you thought of his statement.", ops: [" Critique him ", " Tell him about Mr. K "]),
                          problem(p: "The doctor is surprised on your comeback. He looks shocked. You start to feel better because you gave him a piece of your mind, but at the same time you don't want to be in the same presence as him.", ops: ["Walk away, respectfully", " Tell him don't ever underestimate a female again"]),
    problem(p: "you go girl! You gave him a piece of your mind, your still a little overwhelmed in all the events that happened this week, you want to make a change but you just don't know how, you want to show the world what your capable of and how females can run the world without any males help", ops: [" Exit"])]
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
        let path = Bundle.main.path(forResource: "doctor.mp3", ofType:nil)!
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
            performSegue(withIdentifier: "ending", sender: self)
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


