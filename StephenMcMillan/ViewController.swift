//
//  ViewController.swift
//  StephenMcMillan
//
//  Created by Stephen McMillan on 14/04/2015.
//  Copyright (c) 2015 Stephen McMillan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var headerImageView: UIImageView!

    @IBOutlet var aboutMe: UIView!
    @IBOutlet var education: UIView!
    @IBOutlet var skills: UIView!
    @IBOutlet var projects: UIView!

    @IBOutlet var shimmeringView: FBShimmeringView!
    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                
        headerImageView.image = UIImage(named: "me")
        headerImageView.layer.cornerRadius = headerImageView.frame.size.width/2
        headerImageView.layer.masksToBounds = true
        
        // About Me View
        
        let aboutMeTap = UITapGestureRecognizer(target: self, action: Selector("callAboutView"))
        aboutMe.userInteractionEnabled = true
        aboutMe.addGestureRecognizer(aboutMeTap)
        
        // Education View
        
        let educationTap = UITapGestureRecognizer(target: self, action: Selector("callEducationView"))
        education.userInteractionEnabled = true
        education.addGestureRecognizer(educationTap)
        
        // Skills View
        
        let skillsTap = UITapGestureRecognizer(target: self, action: Selector("callSkillsView"))
        skills.userInteractionEnabled = true
        skills.addGestureRecognizer(skillsTap)
        
        // Projects View
        
        let projectTap = UITapGestureRecognizer(target: self, action: Selector("callProjectView"))
        projects.userInteractionEnabled = true
        projects.addGestureRecognizer(projectTap)
        
        // Shimmering Effect
        
        shimmeringView.contentView = nameLabel
        shimmeringView.shimmering = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func callAboutView() {
            self.performSegueWithIdentifier("showAboutMe", sender: self)
    }
    
    func callEducationView() {
            self.performSegueWithIdentifier("showEducation", sender: self)
    }
    
    func callSkillsView() {
            self.performSegueWithIdentifier("showSkills", sender: self)
    }
    
    func callProjectView() {
            self.performSegueWithIdentifier("showProjects", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

