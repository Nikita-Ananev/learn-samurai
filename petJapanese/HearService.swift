//
//  HearService.swift
//  petJapanese
//
//  Created by Никита Ананьев on 27.10.2020.
//

import Foundation

struct HearService {
    var selectedSymbolIndex: Int
    var selectedSymbol: Symbol?
    var selectedGroup : [Symbol]?
    
    
    mutating func nextSelectedSymbol() -> Bool{
        if selectedGroup!.count - 1 > selectedSymbolIndex {
            selectedSymbol = selectedGroup?[selectedSymbolIndex + 1]
            selectedSymbolIndex += 1
            return false
        } else {
            return true
        }

    }
    mutating func choiceSelectedSymbol(tagButton: Int) {
        selectedSymbolIndex = tagButton
        selectedSymbol = selectedGroup?[selectedSymbolIndex]
    }
}
