//
//  Lession.swift
//  petJapanese
//
//  Created by Никита Ананьев on 12.10.2020.
//

import UIKit

struct Lession: Hashable {
    
    
    let id: Int
    let name: String
    let image: UIImage
    
    var progress: Float
    let group: [Symbol]
    
    static func == (lhs: Lession, rhs: Lession) -> Bool {
        if lhs.id == rhs.id {
            return true
        } else {
            return false
        }
    }
}

