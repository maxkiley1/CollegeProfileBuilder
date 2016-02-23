//
//  College.swift
//  College Profile Builder
//
//  Created by maxkiley on 1/21/16.
//  Copyright © 2016 maxkiley. All rights reserved.
//

import UIKit

class College: NSObject
{
    //Object properties
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var picture = UIImage(named: "Default")
    var website = ""


//initializer for the Name, Location, Number and Picture
    init(Name: String, Location: String, NumberOfStudents: Int, Picture: UIImage, Website: String)
    {
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        picture = Picture
        website = Website
    }
    
    
    init(Name: String, Location: String, Website: String)
    {
        super.init()
        name = Name
        location = Location
        website = Website
    }






}

