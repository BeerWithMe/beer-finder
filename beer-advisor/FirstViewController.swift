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
        
        let url = NSURL(string: "http://localhost:3000/questionnaire")
        
        let sharedSession = NSURLSession.sharedSession() //This sets up an asynchronous environment??
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(url, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if error == nil {
                let dataObject = NSData(contentsOfURL: location) //This gets the data from the url as a huge list of packets.
                let beerQuestionnaireData: NSArray = NSJSONSerialization.JSONObjectWithData(dataObject, options: nil, error: nil) as NSArray
                //This transforms the list of packets into a usable array of JS-like objects.
                var url1: AnyObject = beerQuestionnaireData[0]["imgUrl"]!!//Apparently there are two layers of "optionals"
                let imgUrl = NSURL.URLWithString("\(url1)")
                var err: NSError?
                var imageData: NSData = NSData.dataWithContentsOfURL(imgUrl, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)
                self.questionnaireImage.image = UIImage(data: imageData)
                
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

