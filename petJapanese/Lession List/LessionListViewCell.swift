//
//  LessionListViewCell.swift
//  petJapanese
//
//  Created by Никита Ананьев on 12.10.2020.
//

import UIKit

class LessionListViewCell: UITableViewCell {
    
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var sectionImage: UIImageView!
    @IBOutlet weak var progressViewOfSection: UIProgressView!
    @IBOutlet weak var skillLevelLabel: UILabel!
    
    @IBOutlet weak var practiceButton: UIButton!
    
    
    func configure(lession: Lession) {
        
        progressViewOfSection.progress = lession.progress
        skillLevelLabel.text = "Завершен на \(Int(lession.progress * 100))%"
        if lession.progress == 0.0 {
            skillLevelLabel.text = "Нет прогресса"
        }
        
        sectionNameLabel.text = lession.name
        sectionImage.image = lession.image
        
        
        practiceButton.layer.cornerRadius = practiceButton.frame.height / 5
        
    }
    
}
