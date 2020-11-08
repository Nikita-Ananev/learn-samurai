//
//  ViewController.swift
//  petJapanese
//
//  Created by Никита Ананьев on 06.10.2020.
//

import UIKit

class MainVC: UIViewController {
    let user = User.shared
    
    @IBOutlet weak var backViewForButton2: UIView!
    @IBOutlet weak var backViewForButton1: UIView!

    
    @IBOutlet weak var countOfHeartLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var trainButton: UIButton!
    @IBOutlet weak var fightButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countOfHeartLabel.text = String(user.lives)
        levelLabel.text = String(user.access.last?.lession ?? 0)
        
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
                        self.trainButton.transform = CGAffineTransform(scaleX: 20.0, y: 20.0)
                        self.trainButton.setTitle("", for: .normal)
                        self.fightButton.isHidden = true
                        self.backViewForButton1.isHidden = true


                       }, completion: {_ in
                        UIView.animate(withDuration: 0.4) {
                            self.performSegue(withIdentifier: "toLessionList", sender: self)
                            self.trainButton.transform = CGAffineTransform.identity
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                                self.trainButton.setTitle("Train", for: .normal)
                                self.fightButton.isHidden = false
                                self.backViewForButton1.isHidden = false
                            })
                           




                        }
                       })
    }
    @IBAction func fightButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations: {
                        self.fightButton.transform = CGAffineTransform(scaleX: 20.0, y: 20.0)
                        self.fightButton.setTitle("In dev", for: .normal)
                       }, completion: {_ in
                        UIView.animate(withDuration: 0.2) {
                            self.fightButton.transform = CGAffineTransform.identity
                        }
                       })
    }
    
}

