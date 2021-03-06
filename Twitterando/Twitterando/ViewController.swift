//
//  ViewController.swift
//  Twitterando
//
//  Created by Kevin Tan on 2/5/18.
//  Copyright © 2018 ACM Hack. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {

    var tweetView: TWTRTweetView!
    
    @IBAction func tappedGenerate(_ sender: UIButton) {
        
        // Generate random number from 0 ... 1b
        let randomID = arc4random_uniform(1000000000)
        
        TWTRAPIClient().loadTweet(withID: String(randomID)) { tweet, error in

            if let t = tweet {
                self.tweetView.removeFromSuperview()
                self.tweetView = TWTRTweetView(tweet: t)
                self.tweetView.center = self.view.center
                self.view.addSubview(self.tweetView)
            }
            
            else {
                print("Failed to load Tweet: \(String(describing: error?.localizedDescription))")
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tweetView = TWTRTweetView()
        tweetView.center = self.view.center
        
        self.view.addSubview(tweetView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

