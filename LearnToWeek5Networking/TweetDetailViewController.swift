//
//  TweetDetailViewController.swift
//  Tweeter
//
//  Created by Chris McClune on 16/06/2019.
//  Copyright © 2019 Chris McClune. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
  
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var tweetLabel: UILabel!
  @IBOutlet weak var tweetDateLabel: UILabel!
  
  var tweet: Tweet?
  
  let dateFormatter = DateFormatter()
  
  // Use this style of init when loading a view from a .XIB file instead of storyboard.
//  init(tweet: Tweet) {
//    self.tweet = tweet
//    super.init(nibName: "TweetDetailViewController", bundle: Bundle.main)
//  }
  
  // Use this style of init for loading a view from storyboard when not using a segue
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupTweetData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .medium
    setupTweetData()
  }
  
  private func setupTweetData() {
    guard let tweet = tweet else {
      return
    }
    
    nameLabel.text = tweet.tweetedBy
    tweetLabel.text = tweet.tweet
    tweetDateLabel.text = dateFormatter.string(from: tweet.dateTweeted)
    loadProfileImage(from: tweet.avatarUrl)
  }

    private func loadProfileImage(from urlString: String) {
        let avatarUrl = URL(string: urlString)!
        let data = try! Data(contentsOf: avatarUrl)
        profileImageView.image = UIImage(data: data)

        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
}
