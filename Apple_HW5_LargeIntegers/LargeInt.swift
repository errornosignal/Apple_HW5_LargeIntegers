//
//  LargeInt.swift
//  Apple_HW5_LargeIntegers
//
//  Created by Reid Nolan on 12/7/17.
//  Copyright © 2017 Reid Nolan. All rights reserved.
//

import Foundation

//LargeInt class to handle addition of extremely large integers
struct LargeInt {
    
    var value: String
    
    //function to add two LargeInt objects and return the sum
    func add(right: LargeInt) -> LargeInt {
        let userInput1 = String(describing: value.map { (String($0)) })
        let userInput2 = String(describing: right.value.map { (String($0)) })
        
        //initialize array components
        var tdArray: [[Int]] = []
        var row1: [Int] = []
        var row2: [Int] = []
        var row3: [Int] = []
        
        //loop throught characters in strings, verify numeric, and add to row array
        for char in userInput1 {
            if(isDigit(char: char)) {
                let newChar = charToInt(tempChar: char)
                row1.append(newChar)
            } else {/*doNothing*/}
        }
        for char in userInput2 {
            if(isDigit(char: char)) {
                let newChar = charToInt(tempChar: char)
                row2.append(newChar)
            } else {/*doNothing*/}
        }
        
        //get size of largest row (number of digits) and initialize array
        let maxColumns = max(row1.count, row2.count)
        var result = [Int](repeating: 0, count: maxColumns)

        //insert leaing zeroes as buffer for carrying-over
        while (row1.count < maxColumns) {
            row1.insert(0, at: 0)
        }
        while (row2.count < maxColumns) {
            row2.insert(0, at: 0)
        }
        
        //add zeroes to give room to carry-over 10s place for when adding digits
        row1.insert(0, at: 0)
        row2.insert(0, at: 0)
        tdArray.append(row1) //add row1 to array (1st user input)
        tdArray.append(row2) //add row2 to array (2nd user input)
        
        //add array elements for each place-value
        for i in 0..<(maxColumns+1) {
            let sum = row1[i] + row2[i]
            row3.append(sum)
        }
        //carry over 10s place to previous element
        for i in (0..<maxColumns+1) {
            if (row3[i] > 9) {
                row3[i-1] = (row3[i] / 10 % 10) + row3[i-1]
                row3[i] = row3[i] % 10
            } else {/*doNothing()*/}
        }
        
        //add 3rd row to array and save to variable
        tdArray.append(row3)
        
        //drop leading zeroes from result, if they exisit
        for _ in 1..<tdArray[2].count {
            if (tdArray[2].first == 0) {
                tdArray[2] = Array(tdArray[2].dropFirst())
            } else {
                tdArray[2] = tdArray[2]
            }
        }
        
        //copy array to result variable
        result = tdArray[2]
        
        //...FINALLY!!!
        return  LargeInt(value: result.map { String($0) }.joined(separator: ""))
    }
    
    //function to subtract two LargeInt objects and return the difference ***NOT COMPLETE***
    func subtract(right: LargeInt) -> LargeInt {
        //TODO: Build this function
        let str = "Function not complete..."
        return LargeInt(value: str)
    }
}

//override addition operator for addition metho of LargeInt class objects
func + (left: LargeInt, right: LargeInt) -> LargeInt {
    return left.add(right: right)
}

//override subtraction operator for subtraction method of LargeInt class objects
func - (left: LargeInt, right: LargeInt) -> LargeInt {
    return left.subtract(right: right)
}
//convert char to int
func charToInt(tempChar: Character) -> Int {
    switch tempChar {
        case "0": return 0
        case "1": return 1
        case "2": return 2
        case "3": return 3
        case "4": return 4
        case "5": return 5
        case "6": return 6
        case "7": return 7
        case "8": return 8
        case "9": return 9
         default: return 0
    }
}
