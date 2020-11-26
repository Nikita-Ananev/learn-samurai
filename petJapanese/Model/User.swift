//
//  User.swift
//  petJapanese
//
//  Created by Никита Ананьев on 20.10.2020.
//

import Foundation

class User {
    static let shared = User()
    
    var userName = ""
    var access: [ProgressOnLession] = [ProgressOnLession()]
    var currentLession = Int()
    var currentSymbolGroup = [Symbol]()
    
    private init() { }
    
}
