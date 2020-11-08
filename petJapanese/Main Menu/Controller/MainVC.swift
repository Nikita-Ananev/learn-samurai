//
//  ViewController.swift
//  petJapanese
//
//  Created by Никита Ананьев on 06.10.2020.
//

import UIKit

class MainVC: UIViewController {
    let user = User.shared
    
    @IBOutlet weak var countOfHeartLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var colorOfBeltLabel: UILabel!
    
    @IBOutlet weak var imageOfBelt: UIImageView!
    
    @IBOutlet weak var trainButton: UIButton!
    @IBOutlet weak var fightButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countOfHeartLabel.text = String(user.lives)
        levelLabel.text = String(user.access.last?.lession ?? 0)
        
        trainButton.layer.cornerRadius = trainButton.frame.height / 5
        fightButton.layer.cornerRadius = fightButton.frame.height / 5

        

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
    }
    @IBAction func fightButtonPressed(_ sender: UIButton) {
    }
    
}

