//
//  MyEducationViewController.swift
//  StephenMcMillan
//
//  Created by Stephen McMillan on 15/04/2015.
//  Copyright (c) 2015 Stephen McMillan. All rights reserved.
//

import UIKit

class MyEducationViewController: UIViewController {

    @IBOutlet var schoolView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        schoolView.image = UIImage(named: "strangford")
        schoolView.layer.cornerRadius = 12
        schoolView.layer.masksToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
