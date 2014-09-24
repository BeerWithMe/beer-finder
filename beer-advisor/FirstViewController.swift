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
//        var masterView = MasterViewController()
//        masterView.populateView()
        println("You clicked 'recommendations' button!")
    }
    
    @IBAction func submitratingbutton(sender: AnyObject) {
        println("You clicked 'Submit!'")
        beerData.cycleImage()
    }
    
    
    @IBAction func ratingsPicker(sender: UISegmentedControl) {
        println("You picked")
    }
    
    @IBOutlet weak var questionnaireImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let beerData = BeerData()
        let url = NSURL(string: "http://localhost:3000/questionnaire")
        //let url = NSURL(string: beerData.url)
        
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

        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


