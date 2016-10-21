//
//  ViewController.swift
//  RecipeMaster
//
//  Created by Arkadiusz Żmudzin on 19.10.2016.
//  Copyright © 2016 Arkadiusz Żmudzin. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class MainViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var pizzaImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundSquareImageView(imageView: pizzaImageView)
        
        if FacebookHelper.sharedInstance().isLoggedIn() {
            showLoggedInMessage(profile: FacebookHelper.sharedInstance().currentProfile!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    
    @IBAction func loginToFacebook(_ sender: UIBarButtonItem) {
        FacebookHelper.sharedInstance().logIn(from: self, successBlock: { (profile) in
            self.showLoggedInMessage(profile: profile)
        }) { (error) in
                if error != nil {
                    self.showToast(message: "Couldn't log in to Facebook account: \(error?.localizedDescription)")
                }
        }
    }
    
    // MARK: Private
    
    private func showToast(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 4.0, delay: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        })
    }
    
    private func showLoggedInMessage(profile: FacebookHelper.FacebookUserProfile) {
        self.showToast(message: "Logged in as \(profile.firstName!) \(profile.lastName!)")
    }
    
    private func roundSquareImageView(imageView: UIImageView?) {
        if let imageView = imageView {
            imageView.layoutIfNeeded()
            imageView.layer.cornerRadius = imageView.frame.height/2
            imageView.backgroundColor = UIColor.white
        }
    }
}

