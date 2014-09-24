//
//  Recommendations.swift
//  beer-advisor
//
//  Created by Samuel Nelson on 9/22/14.
//  Copyright (c) 2014 BeerWithMe. All rights reserved.
//

import UIKit
import Foundation

public class Recommendations {
    var recommendationList: [AnyObject] = []
    
    
    
    public init() {
        self.downloadData()
    }
    
    
    
    func downloadData() -> Void {
        let url = NSURL(string: "http://localhost:3000/questionnaire")
        
        let sharedSession = NSURLSession.sharedSession() //This sets up an asynchronous environment??
        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(url, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if error == nil {
                let dataObject = NSData(contentsOfURL: location) //This gets the data from the url as a huge list of packets.
                let beerQuestionnaireData: NSMutableArray = NSJSONSerialization.JSONObjectWithData(dataObject, options: nil, error: nil) as NSMutableArray
                //This transforms the list of packets into a usable array of JS-like objects.
                for (var i = 0; i < beerQuestionnaireData.count; i++) {
                    
                    var temp = Recommendation(recommendationDictionary: beerQuestionnaireData[i] as NSDictionary)
                    self.recommendationList.append(temp)
                }
                self.recommendationList = beerQuestionnaireData //Assigning NSArray to a model.
                //println(beerQuestionnaireData)
            }
        })
        downloadTask.resume()
    }

}