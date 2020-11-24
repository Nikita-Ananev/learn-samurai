//
//  QuestionService.swift
//  petJapanese
//
//  Created by Никита Ананьев on 03.11.2020.
//

import UIKit

struct QuestionService {
    var group: [Symbol]?
    var progress: Float?
    var question: Symbol?
    
    mutating func newQuiz(group: [Symbol]){
        if self.group != nil {
            self.question = self.group!.randomElement()!
            let a = Int(group.firstIndex(of: self.question!)!)
            self.group = group
            self.group?.remove(at: a)
        } else {
            self.question = group.randomElement()!
            let a = Int(group.firstIndex(of: self.question!)!)
        self.group = group
        self.group?.remove(at: a)
        }
    }
    
    mutating func checkQuestion(sender: UIButton) -> Bool {
        if sender.titleLabel!.text == question!.soundJap {
            
            if self.progress! >= 0 {
            self.progress! += 0.025
            }
            return true
        } else {
            if self.progress! >= 0.10 {
            self.progress! -= 0.10  
            } else {
                self.progress! = 0.00
            }
            return false
        }
    }
}
