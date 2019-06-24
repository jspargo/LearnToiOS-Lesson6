//
//  TweetTableViewController.swift
//  Twitter
//
//  Created by Chris McClune on 10/06/2019.
//  Copyright © 2019 Chris McClune. All rights reserved.
//

import UIKit

class TweetTableViewController: UITableViewController {

  private var tweets: [Tweet] = []
  private let tweetManager = TweetManager()
  let refreshItem = UIRefreshControl()


  override func viewDidLoad() {
    getTweets()
    tableView.refreshControl = refreshItem

    refreshItem.addTarget(self, action: #selector(getTweets), for: .valueChanged)
    refreshItem.attributedTitle = NSAttributedString(string: "Fetching Tweets ...", attributes: nil)

  }

  // MARK: - Get Tweets

  @objc func getTweets() {
    tweetManager.getTweets { (tweets) in
      self.tweets = tweets
      self.tableView.reloadData()
      self.refreshItem.endRefreshing()
    }
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweets.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell", for: indexPath) as! TweetTableViewCell
    cell.configureCell(tweet: tweets[indexPath.row])
    return cell
  }
  

  // MARK: - SHOW DETAIL WITH SEGUE
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.

    // MAKE SURE THE SEGUE EXISTS AND IS CALLED 'ShowTweetDetail'
    
    if segue.identifier == "ShowTweetDetail" {
      guard let tweetCell = sender as? TweetTableViewCell else { return }
      guard let tweet = tweetCell.tweet else { return }
      guard let destinationViewController = segue.destination as? TweetDetailViewController else { return }
      destinationViewController.tweet = tweet
    }
  }
  
  
}
