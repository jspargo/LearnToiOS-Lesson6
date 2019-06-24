//
//  TweetViewController.swift
//  LearnToWeek2-2019
//
//  Created by Kris Jones on 28/05/2019.
//  Copyright © 2019 Kris Jones. All rights reserved.
//

import UIKit

protocol TweetViewControllerDelegate: class {
  func addTweet(tweet: Tweet)
}

class TweetViewController: UIViewController, UITextViewDelegate, TweetManagerDelegate {
  
  @IBOutlet weak var avatarImage: UIImageView!
  @IBOutlet weak var tweetTextView: UITextView!
  @IBOutlet weak var tweetButton: UIBarButtonItem!
  @IBOutlet weak var tweetCharCounterLabel: UILabel!
  
  let tweetManager = TweetManager()
  
  weak var delegate: TweetViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    tweetManager.delegate = self
    tweetTextView.delegate = self
  }
  
  func setupUI() {
    let image: UIImage = UIImage(named: "avatar")!
    avatarImage.layer.borderWidth = 1.0
    avatarImage.layer.masksToBounds = false
    avatarImage.layer.borderColor = UIColor.white.cgColor
    avatarImage.layer.cornerRadius = avatarImage.frame.size.width/2
    avatarImage.clipsToBounds = true
    avatarImage.image = image
    tweetTextView.layer.cornerRadius = 3
    tweetTextView.layer.borderColor = UIColor.gray.cgColor
    tweetTextView.layer.borderWidth = 1
    tweetTextView.text = ""
    tweetTextView.becomeFirstResponder()
  }
  
  @IBAction func tweetButtonTapped(_ sender: Any) {
    
    if self.tweetManager.isTweetValid(tweet: self.tweetTextView.text) {
      print("Tweet is valid")
      

        tweetManager.sendTweet(tweet: self.tweetTextView.text, user: "JoeBloggs", userAvatarUrl: "https://pbs.twimg.com/profile_images/1035649273721847809/B0f8n_oe_400x400.jpg") {
        let alertView = UIAlertController(title: "Success", message: "Tweet Successfully Sent", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
          self.dismiss(animated: true, completion: nil)
        }))
        self.navigationController?.present(alertView, animated: true, completion: nil)
      }

    } else {
      print("Tweet is not valid")
    }
    
    view.endEditing(true)
    
  }
  
  @IBAction func cancelButtonTapped(_ sender: Any) {
    tweetTextView.text = ""
    tweetCharCounterLabel.text = "0/250"
  }
  
  func textViewDidChange(_ textView: UITextView) {
    tweetCharCounterLabel.text = "\(textView.text.count)/255"
  }
  
  func tweetDidSend(wasSuccessful: Bool) {
    print("We have our call back to let us know the tweet was sent... \(wasSuccessful)")
  }
  
}
