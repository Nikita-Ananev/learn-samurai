//
//  QuestionVC.swift
//  petJapanese
//
//  Created by Никита Ананьев on 29.10.2020.
//

import UIKit

class QuestionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var delegateVC: LessionListTableVCDelegate?
    var serviceQuiz = QuestionService()
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var questionSymbol: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if serviceQuiz.checkQuestion(sender: sender) {
            serviceQuiz.newQuiz(group: delegateVC!.dataForHearVC!)
            questionSymbol.text = serviceQuiz.question!.charJap
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .allowUserInteraction,
                           animations: {
                            self.backgroundView.backgroundColor = .green
                           }, completion: {_ in
                            UIView.animate(withDuration: 0.2) {
                                self.backgroundView.backgroundColor = .none
                            }
                           })
        }
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
                       }, completion: {_ in
                        UIView.animate(withDuration: 0.2) {
                            sender.transform = CGAffineTransform.identity
                        }
                       })
        
        progress.progress = serviceQuiz.progress!

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (delegateVC?.dataForHearVC?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = questionsCollectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        
        cell.button.setTitle("\(delegateVC!.dataForHearVC![indexPath.row].soundJap)", for: .normal)
        cell.layer.cornerRadius = 5
        
        
        return cell
    }
    
    var isHeightCalculated: Bool = false

    

    @IBOutlet weak var questionsCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        questionsCollectionView.delegate = self
        questionsCollectionView.dataSource = self
        serviceQuiz.newQuiz(group: delegateVC!.dataForHearVC!)
        serviceQuiz.progress = 0.0
        progress.progress = serviceQuiz.progress!
        questionSymbol.text = serviceQuiz.question!.charJap
        backgroundView.layer.cornerRadius = 30
        
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
