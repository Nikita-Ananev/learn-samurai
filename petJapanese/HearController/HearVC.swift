//
//  HearVC.swift
//  petJapanese
//
//  Created by Никита Ананьев on 23.10.2020.
//

import UIKit




class HearVC: UIViewController {
    
    let user = User.shared
    var service = HearService(selectedSymbolIndex: 0)
    var groupForLearn: [Symbol]?
    var selectedSymbol: Symbol?
    var buttonIndex = Int()
    
    
    @IBOutlet weak var charInImage: UILabel!
    @IBOutlet weak var imageOfSymbol: UIImageView!
    @IBOutlet weak var listenButton: UIButton!
    @IBOutlet weak var transcriptLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var okButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.selectedGroup = user.currentSymbolGroup
        service.selectedSymbol = service.selectedGroup![0]
        
        transcriptLabel.text = service.selectedSymbol?.charEng
        charInImage.text = service.selectedSymbol?.charJap
        
        service.playSelectedSymbol()
        
        okButton.layer.cornerRadius = okButton.frame.height / 5
        
        
        imageOfSymbol.layer.borderWidth = 0.5
        imageOfSymbol.layer.borderColor = .some(okButton.backgroundColor!.cgColor )
        
        imageOfSymbol.layer.cornerRadius = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        for symbol in service.selectedGroup! {
            let button = UIButton()
            button.setTitle(symbol.charJap, for: .normal)
            button.tag = buttonIndex
            buttonIndex += 1
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.backgroundColor = .some(okButton.backgroundColor!.cgColor )
            button.addTarget(self, action: #selector(buttonAction), for: .touchDown)
            button.addTarget(self, action: #selector(buttonOutside), for: .touchUpInside)
            
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.black.cgColor
            
            stackView.addArrangedSubview(button)
        }
        buttonIndex = 0
        
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations: {
                        self.charInImage.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                       }, completion: {_ in
                        UIView.animate(withDuration: 1) {
                            self.charInImage.transform = CGAffineTransform.identity
                        }
                       })
        
        
    }
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        if service.nextSelectedSymbol() {
            okButton.backgroundColor = .systemGreen
            okButton.setTitle("Тренироваться", for: .normal)
            performSegue(withIdentifier: "toQuestionController", sender: self)
            
        }
        
        transcriptLabel.text = service.selectedSymbol?.charEng
        charInImage.text = service.selectedSymbol?.charJap
        service.playSelectedSymbol()
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations: {
                        self.charInImage.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                       }, completion: {_ in
                        UIView.animate(withDuration: 0.2) {
                            self.charInImage.transform = CGAffineTransform.identity
                            
                            
                        }
                       })
        UIView.animate(withDuration: 0.2,
                       animations: {
                        self.okButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                        
                        
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.3) {
                            self.okButton.transform = CGAffineTransform.identity
                            
                            
                        }
                       })
        
    }
    
    
    //: Button from stackView
    @objc func buttonAction(sender: UIButton!) {
        service.choiceSelectedSymbol(tagButton: sender.tag)
        transcriptLabel.text = service.selectedSymbol?.charEng
        charInImage.text = service.selectedSymbol?.charJap
        service.playSelectedSymbol()
        
        
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations: {
                        self.charInImage.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                       }, completion: {_ in
                        UIView.animate(withDuration: 0.2) {
                            self.charInImage.transform = CGAffineTransform.identity
                            
                            
                        }
                       })
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.5)
                       })
        
        
        
        
    }
    @objc func buttonOutside(sender: UIButton!) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity
                       })
        
        
    }
    
    
    @IBAction func listenButtonPressed(_ sender: UIButton) {
        service.playSelectedSymbol()
        
        UIView.animate(withDuration: 0.2,
                       animations: {
                        self.listenButton.setImage(#imageLiteral(resourceName: "ЧувачокГоворит2"), for: .normal)
                        self.listenButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                        self.charInImage.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                        
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.2) {
                            self.charInImage.transform = CGAffineTransform.identity
                            self.listenButton.transform = CGAffineTransform.identity
                            self.listenButton.setImage(#imageLiteral(resourceName: "Чувачок"), for: .normal)
                            
                        }
                       })
    }
    
}

