//
//  LessionListTableVC.swift
//  petJapanese
//
//  Created by Никита Ананьев on 12.10.2020.
//

import UIKit
import RealmSwift

class LessionListTableVC: UITableViewController {
    let realm = try! Realm()
    var user = User.shared


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        user.access = Array(realm.objects(ProgressOnLession.self))
        tableView.reloadData()
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessionListCell", for: indexPath) as! LessionListViewCell

        
        let cellPrototype = lessions[indexPath.row]

        if indexPath.row <= Array(arrayLiteral: user.access).count  {
            cell.progressViewOfSection.progress = user.access[indexPath.row].progress
            cell.skillLevelLabel.text = "Завершен на \(Int(user.access[indexPath.row].progress * 100))%"


            
        } else {
            cell.practiceButton.isHidden = false
            cell.progressViewOfSection.progress = 0.0
            cell.skillLevelLabel.text = "Нет прогресса"

        }
        cell.practiceButton.tag = indexPath.row
        cell.sectionNameLabel.text = cellPrototype.name
        cell.sectionImage.image = cellPrototype.image
        
        
        cell.practiceButton.layer.cornerRadius = cell.practiceButton.frame.height / 5


        return cell
    }

    @IBAction func practicButtonPressed(_ sender: UIButton) {
        user.currentSymbolGroup = hiraganaGroups[sender.tag]
        user.currentLession = sender.tag
    }

    
}

