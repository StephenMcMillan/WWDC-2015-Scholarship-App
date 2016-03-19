//
//  SkillsWebViewController.swift
//  StephenMcMillan
//
//  Created by Stephen McMillan on 22/04/2015.
//  Copyright (c) 2015 Stephen McMillan. All rights reserved.
//

import UIKit

class SkillsWebViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = NSURL(string: "http://teamtreehouse.com/stephenmcmillan")
        let request = NSURLRequest(URL: url!)
        
        webView.delegate = self
        webView.loadRequest(request)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
        let errorAlert = UIAlertView(title: "Oops!", message: "Error loading webpage - check your internet connection and try again.", delegate: self, cancelButtonTitle: "OK")
        
        errorAlert.show()
        
        self.navigationController?.popViewControllerAnimated(true)
        }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
