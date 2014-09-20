//
//  FirstViewController.swift
//  beer-advisor
//
//  Created by Samuel Nelson on 9/16/14.
//  Copyright (c) 2014 BeerWithMe. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let beerData = BeerData()
    
    @IBAction func DontKnow(sender: AnyObject) {
        println("You clicked the 'don't know' button!")
    }
    
    @IBAction func RecommendationButton(sender: AnyObject) {
        println("You clicked 'recommendations' button!")
    }
    
    @IBAction func submitratingbutton(sender: AnyObject) {
        println("You clicked 'Submit!'")
        beerData.cycleImage()
    }
    
    @IBAction func ratingslider(sender: AnyObject) {
        println("You slid!")
    }
    
    @IBOutlet weak var questionnaireImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        let baseURL = NSURL(string: "localhost:3000/")
//        let sharedSession = NSURLSession.sharedSession()
//        
//        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(baseURL, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
//            
//            if error == nil {
//                let dataObject = NSData(contentsOfURL: location)
//                let testDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject, options: nil, error: nil) as NSDictionary
//                let testBeerData = BeerData(testDictionary: testDictionary)
//                println(testBeerData)
//                println("Hi guys!")
//
//            }
//        })
//        downloadTask.resume()
        
        let url = NSURL(string: "http://localhost:3000/")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

