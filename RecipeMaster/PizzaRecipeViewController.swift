//
//  PizzaRecipeViewController.swift
//  RecipeMaster
//
//  Created by Arkadiusz Żmudzin on 19.10.2016.
//  Copyright © 2016 Arkadiusz Żmudzin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Nuke

class PizzaRecipeViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsStackView: UIStackView!
    @IBOutlet weak var preparingStackView: UIStackView!
    @IBOutlet weak var imagesStackView: UIStackView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var loggedInView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRecipe()

        if FacebookHelper.sharedInstance().isLoggedIn() {
            if let profile = FacebookHelper.sharedInstance().currentProfile {
                Nuke.loadImage(with: URL(string: profile.profilePictureUrl!)!, into: profileImageView)
                profileNameLabel.text = "Logged in as \(profile.firstName!) \(profile.lastName!)"
            }
        } else {
            loggedInView.isHidden = true
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    */
    
    private func getRecipe() {
        ApiClient.getRecipe(completionHandler: { recipe in
            self.descriptionLabel.text = recipe.description
            self.addStringListToStackView(to: self.ingredientsStackView, fromList: recipe.ingredients)
            self.addStringListToStackView(to: self.preparingStackView, fromList: recipe.preparations)
            self.addImagesListToStackView(to: self.imagesStackView, fromList: recipe.images)
            self.activityIndicatorView.stopAnimating()
            self.mainStackView.isHidden = false
            
        })
    }
    
    private func addStringListToStackView(to: UIStackView, fromList: [String]) {
        for i in 0..<fromList.count {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            label.text = fromList[i]
            label.numberOfLines = 0
            to.addArrangedSubview(label)
        }
    }
    
    private func addImagesListToStackView(to: UIStackView, fromList: [String]) {
        for i in 0..<fromList.count {
            let image = UIImageView()
            Nuke.loadImage(with: URL(string: fromList[i])!, into: image)
            image.clipsToBounds = true
            to.addArrangedSubview(image)
        }
    }
}
