//
//  ViewController.swift
//  SwifterTest
//
//  Created by Jerel Rocktaschel rMBP on 9/17/20.
//  Copyright © 2020 HighScoreApps. All rights reserved.
//

import UIKit
import Swifter

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let swifter = Swifter(consumerKey: "TWITTER_APP_API_KEY", //API Key
        consumerSecret: "TWITTER_APP_SECRET_API_KEY") //Secret API Key
        
        if let callbackURL = URL(string: "TWITTER_APP_CALLBACK_URL://success") {
            swifter.authorize(withCallback: callbackURL, presentingFrom: self, success: { token, _ in
                print("MUCH SUCCESS")
                var jsonResult: [JSON] = []
                swifter.getHomeTimeline(count: 10, success: { json in
                        jsonResult = json.array ?? []
                        print(jsonResult)
                    }, failure: { error in
                        print("ERROR")
                    })
            }, failure: { error in
              print("ERROR")
            })
        }
    }
}

