//
//  LargeInt.swift
//  Apple_HW5_LargeIntegers
//
//  Created by Reid Nolan on 12/7/17.
//  Copyright © 2017 Reid Nolan. All rights reserved.
//

import Foundation

class LargeInt {
    //property
    var mInt: String
    
    //initializer
    init (mInt: String) {
        self.mInt = mInt
    }
    
    //convert char to int
    func charToInt(tempChar: Character) -> Int {
        switch tempChar {
        case "0":
            return 0
        case "1":
            return 1
        case "2":
            return 2
        case "3":
            return 3
        case "4":
            return 4
        case "5":
            return 5
        case "6":
            return 6
        case "7":
            return 7
        case "8":
            return 8
        case "9":
            return 9
        default:
            return 0
        }
    }
}





