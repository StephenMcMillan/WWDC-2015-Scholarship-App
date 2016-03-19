//
//  AboutMeViewController.swift
//  StephenMcMillan
//
//  Created by Stephen McMillan on 15/04/2015.
//  Copyright (c) 2015 Stephen McMillan. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var personalImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        personalImage.image = UIImage(named: "me")
        personalImage.layer.cornerRadius = personalImage.frame.size.width/2
        personalImage.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
