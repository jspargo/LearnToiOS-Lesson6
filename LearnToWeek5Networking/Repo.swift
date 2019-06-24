//
//  Repo.swift
//  LearnToWeek5Networking
//
//  Created by Kris Jones on 18/06/2019.
//  Copyright © 2019 Kris Jones. All rights reserved.
//

import Foundation


class Repo {

  let name: String
  let avatar: String
  let ownerName: String

  init(jsonDictionary: [String: Any] ) {

    self.name = jsonDictionary["name"] as! String
    self.avatar = jsonDictionary["name"] as! String
    self.ownerName = jsonDictionary["name"] as! String

  }
}
