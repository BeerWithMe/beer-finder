//
//  Beer.swift
//  beer-advisor
//
//  Created by Iago Wandalsen Prates on 10/2/14.
//  Copyright (c) 2014 BeerWithMe. All rights reserved.
//

import Foundation

class Beer {
    let name : String
    let imgUrl : String
    let beernameInDB : String
    init(name : String, imgUrl: String, beernameInDB : String){
        self.name = name
        self.imgUrl = imgUrl
        self.beernameInDB = beernameInDB
    }
}

 // ['name': 'Budweiser', 'imgUrl': 'https://s3.amazonaws.com/brewerydbapi/beer/1P45iR/upload_upBR4q-large.png', 'beernameInDB':'Anheuser-Busch InBev-Budweiser']