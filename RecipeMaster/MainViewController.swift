//
//  ViewController.swift
//  RecipeMaster
//
//  Created by Arkadiusz Żmudzin on 19.10.2016.
//  Copyright © 2016 Arkadiusz Żmudzin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var pizzaImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundSquareImageView(imageView: pizzaImageView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func roundSquareImageView(imageView: UIImageView?) {
        if let imageView = imageView {
            imageView.layoutIfNeeded()
            imageView.layer.cornerRadius = imageView.frame.height/2
            imageView.backgroundColor = UIColor.white
        }
    }

}

