//
//  FirstViewController.swift
//  beer-advisor
//
//  Created by Samuel Nelson on 9/16/14.
//  Copyright (c) 2014 BeerWithMe. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var array : [Beer] = [
        Beer(name: "Budweiser", imgUrl: "https://s3.amazonaws.com/brewerydbapi/beer/1P45iR/upload_upBR4q-large.png", beernameInDB:"Anheuser-Busch InBev-Budweiser"),
        Beer(name: "Racer 5 IPA", imgUrl: "https://s3.amazonaws.com/brewerydbapi/beer/o1OELJ/upload_OutGJZ-large.png", beernameInDB:"Bear Republic Brewing Company-Racer 5 IPA"),
        Beer(name: "Anchor Steam", imgUrl: "https://s3.amazonaws.com/brewerydbapi/beer/Uiol9p/upload_drOw0u-large.png", beernameInDB:"Anchor Brewing Company-Anchor Steam"),
        Beer(name: "Guinness Draught", imgUrl: "https://s3.amazonaws.com/brewerydbapi/beer/StkEiv/upload_etArOb-large.png", beernameInDB:"Guinness-Guinness Draught"),
        Beer(name: "Blue Moon Belgian White", imgUrl: "https://s3.amazonaws.com/brewerydbapi/beer/dDXOEp/upload_SZEtGz-large.png", beernameInDB:"Blue Moon Brewing Company-Blue Moon Belgian White"),
        Beer(name: "Lagunitas - IPA", imgUrl: "https://s3.amazonaws.com/brewerydbapi/beer/iLlMCb/upload_xp2OJo-large.png", beernameInDB:"Lagunitas Brewing Company-IPA"),
        Beer(name: "Pliny the Elder", imgUrl: "https://s3.amazonaws.com/brewerydbapi/beer/XAXGgF/upload_or9CTI-large.png", beernameInDB:"Russian River Brewing Company-Pliny the Elder")
    ]
    var arrayIndex = 0
    
    
    //let beerData = BeerData()
    
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
        if arrayIndex < array.count{
            self.cycleImage()
        } else {
            // go to the app
            println("its over")
        }
    }
    
    
    @IBAction func ratingsPicker(sender: UISegmentedControl) {
        println("You picked")
    }
    
    @IBOutlet weak var questionnaireImage: UIImageView!
    
    
    func cycleImage (){
        arrayIndex++
        questionnaireImage.image = array[arrayIndex].img
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionnaireImage.image = array[arrayIndex].img
//        let beerData = BeerData()
//        let url = NSURL(string: "http://localhost:3000/questionnaire")
//        //let url = NSURL(string: beerData.url)
//        
//        let sharedSession = NSURLSession.sharedSession() //This sets up an asynchronous environment??
//        let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(url, completionHandler: { (location: NSURL!, response: NSURLResponse!, error: NSError!) -> Void in
//            
//            if error == nil {
//                let dataObject = NSData(contentsOfURL: location) //This gets the data from the url as a huge list of packets.
//                let beerQuestionnaireData: NSArray = NSJSONSerialization.JSONObjectWithData(dataObject, options: nil, error: nil) as NSArray
//                //This transforms the list of packets into a usable array of JS-like objects.
//                var url1: AnyObject = beerQuestionnaireData[0]["imgUrl"]!!//Apparently there are two layers of "optionals"
//                let imgUrl = NSURL.URLWithString("\(url1)")
//                var err: NSError?
//                var imageData: NSData = NSData.dataWithContentsOfURL(imgUrl, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)
//                self.questionnaireImage.image = UIImage(data: imageData)
//            }
//        })
//        downloadTask.resume()

        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


}


// array += newBeer



/*['name': 'Budweiser', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/1P45iR/upload_upBR4q-large.png', 'beernameInDB':'Anheuser-Busch InBev-Budweiser'],

['name': 'Racer 5 IPA', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/o1OELJ/upload_OutGJZ-large.png', 'beernameInDB':'Bear Republic Brewing Company-Racer 5 IPA'],

['name': 'Anchor Steam' , 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/Uiol9p/upload_drOw0u-large.png', 'beernameInDB':'Anchor Brewing Company-Anchor Steam'],

['name': 'Guinness Draught', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/StkEiv/upload_etArOb-large.png', 'beernameInDB':'Guinness-Guinness Draught'],

['name': 'Blue Moon Belgian White' , 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/dDXOEp/upload_SZEtGz-large.png', 'beernameInDB':'Blue Moon Brewing Company-Blue Moon Belgian White'],

['name': 'Lagunitas - IPA', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/iLlMCb/upload_xp2OJo-large.png', 'beernameInDB':'Lagunitas Brewing Company-IPA'],

['name': 'Pliny the Elder', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/XAXGgF/upload_or9CTI-large.png', 'beernameInDB':'Russian River Brewing Company-Pliny the Elder']
*/

