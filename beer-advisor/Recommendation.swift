//
//  Recommendation.swift
//  beer-advisor
//
//  Created by Samuel Nelson on 9/23/14.
//  Copyright (c) 2014 BeerWithMe. All rights reserved.
//

import UIKit

public class Recommendation: NSObject {
    
    public var name: String
    public var id: Int
    public var imgUrl: UIImage?
    
    public init(recommendationDictionary: NSDictionary) {
        name = recommendationDictionary["name"] as String
        id = recommendationDictionary["id"] as Int
    }
    
}
