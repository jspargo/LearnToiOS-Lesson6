
//
//  Tweet.swift
//  LearnToWeek2-2019
//
//  Created by Kris Jones on 03/06/2019.
//  Copyright © 2019 Kris Jones. All rights reserved.
//

import Foundation


class Tweet {

  var tweet: String
  var tweetedBy: String
  var avatarUrl: String
  var dateTweeted: Date

  init(json: [String: Any]) {
    self.tweet = json["text"] as! String
    self.tweetedBy = json["tweetedBy"] as! String
    self.avatarUrl = json["avatarUrl"] as! String
    self.dateTweeted = Date(timeIntervalSince1970:json["createdAt"] as! Double)
  }

}

