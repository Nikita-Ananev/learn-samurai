//
//  ProgressOnLession.swift
//  petJapanese
//
//  Created by Никита Ананьев on 23.11.2020.
//

import Foundation
import RealmSwift


class ProgressOnLession: Object {
    @objc dynamic var lessionID: Int = 1
    @objc dynamic var progress: Float = 0.0
    
    override static func primaryKey() -> String? {
            return "lessionID"
        }
}
