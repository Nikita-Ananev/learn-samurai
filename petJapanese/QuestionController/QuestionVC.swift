//
//  QuestionVC.swift
//  petJapanese
//
//  Created by Никита Ананьев on 29.10.2020.
//

import UIKit
import RealmSwift




class QuestionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    var serviceQuiz = QuestionService()
    
    var user = User.shared
    let realm = try! Realm()
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var questionSymbol: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    
    
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        if serviceQuiz.checkQuestion(sender: sender) {
            serviceQuiz.newQuiz(group: user.currentSymbolGroup)
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
            UIView.transition(with: self.questionSymbol, duration: 0.2, options: .transitionFlipFromBottom, animations: {
                
                self.view.translatesAutoresizingMaskIntoConstraints = false
                
                
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .allowUserInteraction,
                           animations: {
                            self.backgroundView.backgroundColor = .red
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
        
        
        
        
        let dataFromRealm = realm.objects(ProgressOnLession.self)
        
        for lession in dataFromRealm {
            if lession.lessionID == user.currentLession {
                try! realm.write {
                    lession.progress = serviceQuiz.progress!
                    realm.add(lession, update: .modified)
                }
            }
        }
        progress.progress = serviceQuiz.progress!
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.currentSymbolGroup.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = questionsCollectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        
        cell.button.setTitle("\(user.currentSymbolGroup[indexPath.row].soundJap)", for: .normal)
        cell.layer.cornerRadius = 5
        
        
        return cell
    }
    
    @IBOutlet weak var questionsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsCollectionView.delegate = self
        questionsCollectionView.dataSource = self
        serviceQuiz.newQuiz(group: user.currentSymbolGroup)
        serviceQuiz.progress = user.access[user.currentLession].progress
        
        progress.progress = serviceQuiz.progress ?? 0.0
        questionSymbol.text = serviceQuiz.question?.charJap ?? "error"
        backgroundView.layer.cornerRadius = 30
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent {
            NotificationCenter.default.post(name: NSNotification.Name("ReloadData"), object: nil)
        }
    }
}
