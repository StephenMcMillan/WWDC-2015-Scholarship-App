//
//  MyProjectsViewController.swift
//  StephenMcMillan
//
//  Created by Stephen McMillan on 15/04/2015.
//  Copyright (c) 2015 Stephen McMillan. All rights reserved.
//

import UIKit

class MyProjectsViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    var appTitles: NSArray!
    var appImages: NSArray!
    var appDescriptions: NSArray!
    var appURLS: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.appTitles = NSArray(objects: "Big Book of Airliners", "Daily Riddle", "Factly")
        
        self.appDescriptions = NSArray(objects:
            "Big Book of Airliners is my most recent development and my favourite! I combined the two things i love to create it; aviation and app development. It's a modern reference app for aviation geeks like myself that provides information such as current status, date of first flight and engine type. Additionally there is an image to go along with the statistics at the top. Like with my other apps i created it because it was about something that interested me.",
            
            "Daily Riddle was created soley due to the fact that me and my friend from school loved sharing riddles with each other. Therefore I had the idea to combine all our favourite riddles and more into an app which would reveal 'a riddle a day' to the user. I thought this was a cool way to brighten up someones morning. Again it was just a simple idea that mattered to me and that's the reason why i made it! Furthermore, Daily Riddle was my first app written with Swift - very enjoyable.",
            
            "Factly was my most time consuming app but i was extremely happy with the end result. The idea, like my other apps, was simple. I collected many interesting facts and created an app that allowed people to swipe through them and save them. I created Factly because there were some really cool facts that i thought more people should know about. For example - did you know that the medical term for ice cream headaches is sphenopalatine ganglioneuralgia? Cool!")
        
        self.appImages = NSArray(objects: "bigBookOfAirliners","dailyRiddle","Factly")
                
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        var initialViewController = self.viewControllerAtIndex(0) as ContentViewController
        var viewControllers = NSArray(object: initialViewController)
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController {
    
        if self.appTitles.count == 0 || index >= self.appTitles.count {
            return ContentViewController()
        }
        
        var contentViewController: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        
        contentViewController.titleText = self.appTitles[index] as! String
        contentViewController.appImageName = self.appImages[index] as! String
        contentViewController.descriptionText = self.appDescriptions[index] as! String
        contentViewController.pageIndex = index
        
        return contentViewController
        
    }
    
    // Page View Controller
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var contentViewController = viewController as! ContentViewController
        var index = contentViewController.pageIndex as Int
        
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var contentViewController = viewController as! ContentViewController
        var index = contentViewController.pageIndex as Int
        
        if index == NSNotFound {
            return nil
        }
        
        index++
        
        if index == self.appTitles.count {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.appTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
