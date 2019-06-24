//
//  TweetDelegate.swift
//  LearnToWeek2-2019
//
//  Created by Kris Jones on 03/06/2019.
//  Copyright © 2019 Kris Jones. All rights reserved.
//

import Foundation

protocol TweetManagerDelegate {
  func tweetDidSend(wasSuccessful: Bool)
}

class TweetManager {

  var networkManager: NetworkManager
  var delegate: TweetManagerDelegate?

  init() {
    self.networkManager = NetworkManager(baseUrl: "https://fbqx0t89ae.execute-api.us-east-1.amazonaws.com/dev/")
  }

  func isTweetValid(tweet: String) -> Bool {
    // Checks length
    return tweet.count < 256
  }

  func getTweets(completion: @escaping ([Tweet]) -> ()) {

    networkManager.get(path: "tweet") { (response) in

      var tweetsToReturn: [Tweet] = []
      for item in response! {
        let tweet = Tweet(json: item as! [String : Any])
        tweetsToReturn.append(tweet)
      }

      completion(tweetsToReturn)
    }
  }


  func sendTweet(tweet: String, user: String, userAvatarUrl: String, completion: @escaping () -> ()) {

    print("***** Sending Tweet ******")

    let requestParameters = ["text": tweet, "avatarUrl": userAvatarUrl,
                               "tweetedBy": user]

    networkManager.post(path: "tweet", parameters: requestParameters) { (response) in

      print("***** Tweet Sent ******")
      completion()
    }

  }
}
