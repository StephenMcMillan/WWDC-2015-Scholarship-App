//
//  ContentViewController.swift
//  StephenMcMillan
//
//  Created by Stephen McMillan on 19/04/2015.
//  Copyright (c) 2015 Stephen McMillan. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet var appTitle: UILabel!
    @IBOutlet var appImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var shimmerView: FBShimmeringView!
    
    var pageIndex: Int!
    var titleText: String!
    var appImageName: String!
    var descriptionText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.appTitle.text = self.titleText
        self.appImage.image = UIImage(named: appImageName)
        self.appImage.layer.cornerRadius = 20
        self.appImage.layer.masksToBounds = true
        self.descriptionLabel.text = self.descriptionText
        
        shimmerView.contentView = appTitle
        shimmerView.shimmering = true
    }

    @IBAction func viewOnAppStore(sender: AnyObject) {
        
        var url:NSURL!
        
        switch pageIndex {
            
        case 0:
            url = NSURL(string: "itms-apps://itunes.apple.com/us/app/id967009328")
            break
            
        case 1:
            url = NSURL(string: "itms-apps://itunes.apple.com/us/app/id932546719")
            break
            
        case 2:
            url = NSURL(string: "itms-apps://itunes.apple.com/us/app/id912383799")
            break
        
        default:
            return
        }
        
        
        if UIApplication.sharedApplication().canOpenURL(url) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
