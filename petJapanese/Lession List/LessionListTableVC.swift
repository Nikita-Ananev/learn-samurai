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
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableViewData), name: NSNotification.Name("ReloadData"), object: nil)
        
        
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
        
        var cellPrototype = lessions[indexPath.row]
        cellPrototype.progress = user.access[indexPath.row].progress
        
        cell.practiceButton.tag = indexPath.row
        cell.configure(lession: cellPrototype)
        
        return cell
    }
    
    @IBAction func practicButtonPressed(_ sender: UIButton) {
        user.currentSymbolGroup = hiraganaGroups[sender.tag]
        user.currentLession = sender.tag
    }
    
    @objc func reloadTableViewData() {
        tableView.reloadData()
    }
}

