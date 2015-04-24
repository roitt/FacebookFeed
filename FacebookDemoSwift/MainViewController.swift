//
//  MainViewController.swift
//  FacebookDemoSwift
//
//  Created by Timothy Lee on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var feedTableView: UITableView!
    
    var feed: [NSDictionary]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        feedTableView.rowHeight = UITableViewAutomaticDimension
        reload()
        // Do any additional setup after loading the view.
        
        self.feedTableView.dataSource = self
        self.feedTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload() {
        FBRequestConnection.startWithGraphPath("/me/feed", parameters: nil, HTTPMethod: "GET") { (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
            if let result: AnyObject = result {
                self.feed = (result["data"] as! [NSDictionary])
            }
            
            self.feed = self.feed!.filter(){ (dict: NSDictionary) -> Bool in
                
                if dict.valueForKey("picture") != nil {
                    return true
                } else if dict.valueForKey("message") != nil {
                    return true
                } else {
                    return false
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = self.feed![indexPath.row] as NSDictionary
        var hasMessage = (row.allKeys as NSArray).containsObject("message")
        var hasPhoto = (row.allKeys as NSArray).containsObject("picture")
        var cell: UITableViewCell
        if hasPhoto {
            return tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
        } else {
            return tableView.dequeueReusableCellWithIdentifier("StatusCell", forIndexPath: indexPath) as! StatusCell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let feed = self.feed {
            return self.feed!.count
        } else {
            return 0
        }
        
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }

}
