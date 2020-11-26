//
//  Factory.swift
//  petJapanese
//
//  Created by Никита Ананьев on 12.10.2020.
//

import Foundation


var groupA = [Symbol(charJap: "あ", charEng: "а (a)", soundJap: "a"),
              Symbol(charJap: "い", charEng: "и (i)", soundJap: "i"),
              Symbol(charJap: "う", charEng: "у (u)", soundJap: "u"),
              Symbol(charJap: "え", charEng: "э (e)", soundJap: "e"),
              Symbol(charJap: "お", charEng: "о (o)", soundJap: "o")]

var groupKA = [Symbol(charJap: "か", charEng: "ка (ka)", soundJap: "ka"),
               Symbol(charJap: "き", charEng: "ки (ki)", soundJap: "ki"),
               Symbol(charJap: "く", charEng: "ку (ku)", soundJap: "ku"),
               Symbol(charJap: "け", charEng: "кэ (ke)", soundJap: "ke"),
               Symbol(charJap: "こ", charEng: "ко (ko)", soundJap: "ko")]

var groupSA = [Symbol(charJap: "さ", charEng: "са (sa)", soundJap: "sa"),
               Symbol(charJap: "し", charEng: "си (shi)", soundJap: "shi"),
               Symbol(charJap: "す", charEng: "cу (su)", soundJap: "su"),
               Symbol(charJap: "せ", charEng: "сэ (se)", soundJap: "se"),
               Symbol(charJap: "て", charEng: "тэ (te)", soundJap: "te")]

let hiraganaGroups = [groupA, groupKA, groupSA, groupA, groupKA, groupSA, groupA, groupKA, groupSA]


var lessions: [Lession] = [Lession(id: 0, name: "Введение. Гласные", image: #imageLiteral(resourceName: "Группа Гласные.png"), progress: 0, group: groupA),
                           Lession(id: 1, name: "Группа Ка", image: #imageLiteral(resourceName: "Группа Ки.png"), progress: 0, group: groupKA),
                           Lession(id: 2, name: "Группа Са", image: #imageLiteral(resourceName: "Группа Ми"), progress: 0, group: groupSA),
                           Lession(id: 3, name: "Группа Та", image: #imageLiteral(resourceName: "Группа Ти"), progress: 0, group: groupA),
                           Lession(id: 4, name: "Группа На", image: #imageLiteral(resourceName: "Группа Ти"), progress: 0, group: groupA),
                           Lession(id: 5, name: "Группа Ха", image: #imageLiteral(resourceName: "Группа Ни"), progress: 0, group: groupA),
                           Lession(id: 6, name: "Группа Ра", image: #imageLiteral(resourceName: "Группа Ми"), progress: 0, group: groupA)]

