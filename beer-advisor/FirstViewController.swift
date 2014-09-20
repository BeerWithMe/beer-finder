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
        
        
        
        
        let url = NSURL(string: "http://localhost:3000/questionnaire")
        
        let sharedSession = NSURLSession.sharedSession() //This sets up an asynchronous environment??
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(url, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if error == nil {
                println(response)
                println(location)
                println(error)
                let dataObject = NSData(contentsOfURL: location)
                println(dataObject)
                let weatherDictionary: NSArray = NSJSONSerialization.JSONObjectWithData(dataObject, options: nil, error: nil) as NSArray
                
                println(weatherDictionary)
            }
            
        })
        downloadTask.resume()

                    //let returnData = NSData(contentsOfURL: url, encoding: NSUTF8StringEncoding)
                    

                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
//            let url = NSURL.URLWithString("\(returnData.imageURL)")
//            var err: NSError?
//            var imageData :NSData = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)
//            self.questionnaireImage.image = UIImage(data: imageData)
        
        
       // task.resume()
        
        
        
        
        
        
        
        
        
        
        
        
//        let url = NSURL.URLWithString("");
//        var err: NSError?
//        var imageData :NSData = NSData.dataWithContentsOfURL(url,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)
//        var bgImage = UIImage(data:imageData)
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

