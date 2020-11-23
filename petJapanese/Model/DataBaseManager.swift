//
//  DataBaseManager.swift
//  petJapanese
//
//  Created by Никита Ананьев on 17.11.2020.
//

import Foundation
import RealmSwift

class DBManager {
    private var database:Realm
    static let sharedInstance = DBManager()
    private init() {
       database = try! Realm()
    }
    func getDataFromDB() -> Results<User> {
      let results: Results<Route> =   database.objects(User.self)
      return results
     }
     func addData(object: Item)   {
          try! database.write {
             database.add(object, update: true)
             print("Added new object")
          }
     }
      func deleteAllFromDatabase()  {
           try!   database.write {
               database.deleteAll()
           }
      }
      func deleteFromDb(object: Item)   {
          try!   database.write {
             database.delete(object)
          }
      }
}
