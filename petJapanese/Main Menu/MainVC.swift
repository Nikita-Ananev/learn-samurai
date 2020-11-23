//
//  ViewController.swift
//  petJapanese
//
//  Created by Никита Ананьев on 06.10.2020.
//

import UIKit
import RealmSwift


class MainVC: UIViewController {
    
    var user = User.shared
    let realm = try! Realm()
    
    
    
    @IBOutlet weak var backViewForButton2: UIView!
    @IBOutlet weak var backViewForButton1: UIView!


    @IBOutlet weak var appLabel: UILabel!
    
    @IBOutlet weak var trainButton: UIButton!
    @IBOutlet weak var fightButton: UIButton!
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if realm.objects(ProgressOnLession.self).isEmpty {
            for lession in lessions {
                let newProgress = ProgressOnLession()
                newProgress.lessionID = lession.id
                newProgress.progress = 0.0
                user.access.append(newProgress)
                
                try! realm.write {
                    realm.add(newProgress)
                }
            }
        } else {
            let data =  realm.objects(ProgressOnLession.self)
            user.access = Array(data)
            print(user.access)
        }
      
        
        trainButton.layer.cornerRadius = trainButton.frame.height / 2
        fightButton.layer.cornerRadius = fightButton.frame.height / 2
        backViewForButton1.layer.cornerRadius = backViewForButton1.frame.height / 2
        backViewForButton2.layer.cornerRadius = backViewForButton2.frame.height / 2
        

    }

    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)

    }

    @IBAction func testButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.8,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations: {
                        self.trainButton.transform = CGAffineTransform(scaleX: 20.0, y: 25.0)
                        self.trainButton.setTitle("", for: .normal)
                        
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.35, execute: {
                            self.appLabel.textColor = .white
                            self.fightButton.isHidden = true
                            self.backViewForButton1.isHidden = true
                        })
                        


                       }, completion: {_ in
                        UIView.animate(withDuration: 0.4) {
                            self.performSegue(withIdentifier: "toLessionList", sender: self)
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                                self.trainButton.transform = CGAffineTransform.identity
                                self.trainButton.setTitle("Train", for: .normal)
                                self.fightButton.isHidden = false
                                self.backViewForButton1.isHidden = false
                                self.appLabel.textColor = #colorLiteral(red: 0.7459256053, green: 0.2329387963, blue: 0.21997118, alpha: 1)

                            })
                           




                        }
                       })
    }
    @IBAction func fightButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations: {
                        self.fightButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                        self.fightButton.setTitle("In dev", for: .normal)
                       }, completion: {_ in
                        UIView.animate(withDuration: 0.2) {
                            self.fightButton.transform = CGAffineTransform.identity
                        }
                       })
    }

    
}


