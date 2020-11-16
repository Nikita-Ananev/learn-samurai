//
//  LessionListTableVC.swift
//  petJapanese
//
//  Created by Никита Ананьев on 12.10.2020.
//

import UIKit
protocol LessionListTableVCDelegate {
    var dataForHearVC: [Symbol]? { get }
}
class LessionListTableVC: UITableViewController, LessionListTableVCDelegate {
    var dataForHearVC: [Symbol]?

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lessions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessionListCell", for: indexPath) as! LessionListViewCell
        let mainVC = MainVC()
        let cellPrototype = lessions[indexPath.row]

        if indexPath.row <= mainVC.user.access.count - 1 {
            cell.progressViewOfSection.progress = mainVC.user.access[indexPath.row].progress
            cell.skillLevelLabel.text = "Завершен на \(mainVC.user.access[indexPath.row].progress * 100)%"


            
        } else {
            cell.practiceButton.isHidden = true
            cell.progressViewOfSection.progress = 0.0
            cell.skillLevelLabel.text = "Нет доступа"

        }
        cell.practiceButton.tag = indexPath.row
        cell.sectionNameLabel.text = cellPrototype.name
        cell.sectionImage.image = cellPrototype.image
        
        
        cell.practiceButton.layer.cornerRadius = cell.practiceButton.frame.height / 5


        return cell
    }

    @IBAction func practicButtonPressed(_ sender: UIButton) {
        dataForHearVC = hiraganaGroups[sender.tag]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? HearVC {
            dest.delegateVC = self
            }
        }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
