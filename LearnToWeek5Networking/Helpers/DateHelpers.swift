//
//  DateHelpers.swift
//  LearnToWeek2-2019
//
//  Created by Kris Jones on 03/06/2019.
//  Copyright © 2019 Kris Jones. All rights reserved.
//

import Foundation


public extension Date {
  
  func toString( dateFormat format  : String ) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }

  static func random() -> Date {
    let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
    return Date(timeIntervalSince1970: randomTime)
  }

}
