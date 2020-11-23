//
//  HearService.swift
//  petJapanese
//
//  Created by Никита Ананьев on 27.10.2020.
//

import Foundation
import AVFoundation


struct HearService {
    var player: AVAudioPlayer!
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
    
    
    mutating func playSelectedSymbol() {
        guard let path = Bundle.main.path(forResource: "basic_sounds/\(selectedSymbol!.soundJap )", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath : path)

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
