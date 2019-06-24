//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Chris McClune on 10/06/2019.
//  Copyright © 2019 Chris McClune. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetedByLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
  
    var tweet: Tweet?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func configureCell(tweet: Tweet) {
      self.tweet = tweet
      tweetedByLabel.text = tweet.tweetedBy
      tweetTextLabel.text = tweet.tweet
    }

}
