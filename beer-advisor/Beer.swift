//
//  Beer.swift
//  beer-advisor
//
//  Created by Iago Wandalsen Prates on 10/2/14.
//  Copyright (c) 2014 BeerWithMe. All rights reserved.
//

import Foundation
import UIKit

class Beer {
    let name : String
    let beernameInDB : String
    let imgUrl : NSURL
    var err : NSError?
    let imageData : NSData
    let img : UIImage
    init(name : String, imgUrl: String, beernameInDB : String){
        self.name = name
        self.imgUrl = NSURL.URLWithString(imgUrl);
        self.beernameInDB = beernameInDB
        self.imageData = NSData.dataWithContentsOfURL(self.imgUrl,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)
        self.img = UIImage(data: imageData)
    }
}

 // ['name': 'Budweiser', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/1P45iR/upload_upBR4q-large.png', 'beernameInDB':'Anheuser-Busch InBev-Budweiser']
// NSURL.URLWithString("http://live-wallpaper.net/iphone/img/app/i/p/iphone-4s-wallpapers-mobile-backgrounds-dark_2466f886de3472ef1fa968033f1da3e1_raw_1087fae1932cec8837695934b7eb1250_raw.jpg");

/* var err: NSError?
var imageData :NSData = NSData.dataWithContentsOfURL(url,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)
var bgImage = UIImage(data:imageData) */