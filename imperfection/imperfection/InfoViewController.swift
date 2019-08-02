//
//  InfoViewController.swift
//  imperfection
//
//  Created by GWC2 on 7/30/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit


class InfoViewController: UIViewController {

    @IBOutlet weak var text: UILabel!
    let message: String = "\nWe created this game because we wanted to make a fun interactive way for people to view how a female life is lived.. We also wanted to spread a positive message so that females know what to do in a situation that can be life threatening or dangerous, to show how to be cautious on your surroundings. Some males don't want to just read a article on how to treat a female, so we decided why not take an activity that most males just love to do and spread a message while doing it!\n"
    override func viewDidLoad() {
        super.viewDidLoad()
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 2.0
        text.text = ""
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        text.animation(Message: message, myLabel: text)
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

