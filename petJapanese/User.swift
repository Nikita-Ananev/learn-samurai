//
//  User.swift
//  petJapanese
//
//  Created by Никита Ананьев on 20.10.2020.
//

import Foundation
import RealmSwift

import Foundation

struct ProgressOnLession {
    let lession: Int
    let progress: Float
}
struct User {
    
    static let shared = User()
    
    var userName: String?
    var lives = 3
    var access = [ProgressOnLession(lession: 1, progress: 0.0)]
    
    private init() { }
}
