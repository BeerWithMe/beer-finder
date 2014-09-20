//
//  BeerData.swift
//  beer-advisor
//
//  Created by Samuel Nelson on 9/19/14.
//  Copyright (c) 2014 BeerWithMe. All rights reserved.
//

import UIKit
import Foundation

struct BeerData {
    
    var test: NSDictionary?
    
    init() {
       
    }
    
    func testMethod () -> NSDictionary {
        return test!
    }
    
    func cycleImage () {
        println("You cycled images!")
    }
}