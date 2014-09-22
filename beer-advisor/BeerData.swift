//
//  BeerData.swift
//  beer-advisor
//
//  Created by Samuel Nelson on 9/19/14.
//  Copyright (c) 2014 BeerWithMe. All rights reserved.
//

import UIKit
import Foundation

public struct BeerData {
    
    var questionnaireImages: [String]
    
    public init() {
        questionnaireImages = ["Test1", "Test2"]
    }
    
    public func cycleImage () -> String {
        
        println("You cycled images!")
        return questionnaireImages[0]
    }
    
}

public class XYZ {
    var test: String
    public init() {
        test = "Hello World!"
    }
    public func speak () -> String {
        return test
    }
}

