//
//  animate.swift
//  imperfection
//
//  Created by GWC2 on 7/30/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import Foundation
import UIKit



extension UILabel{
    
    func animation(Message: String, myLabel: UILabel){
        
        myLabel.text = ""
        let characterArray = Array(Message)
        var characterIndex = 0
        Timer.scheduledTimer(withTimeInterval: 0.008, repeats: true, block: { timer in
            if characterIndex < characterArray.count {
                let char = characterArray[characterIndex]
                myLabel.text! += "\(char)"
                characterIndex += 1
            } else {
                timer.invalidate()
            }
        })
    }
    
}
