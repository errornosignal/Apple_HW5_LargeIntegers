//
//  main.swift
//  Apple_HW5_LargeIntegers
//
//  Created by Reid Nolan on 12/7/17.
//  Copyright © 2017 Reid Nolan. All rights reserved.
//

import Foundation

//validate user input (ensures string contains only integer values)
func validateInput(prompt: String) -> String {
    var digitCount = 0
    while (true) {
        print(prompt)
        let userInput = readLine()!.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (!userInput.isEmpty) {
            if (userInput == "quit") {
                exit(1)
            } else {
                for char in userInput {
                    if (isDigit(char: char)) {
                    digitCount += 1 //input breaks if string contains digit followed by a space and then another digit(i.e. "1 1")
                    } else {/*doNothing()*/}
                }
                if (digitCount == userInput.count) {
                    if (Int(userInput) == 0) {
                        print("Error! Zero doesn't count.")
                        digitCount = 0 //reset digit count on invalid input with integers in string
                    } else {
                        print("userInput = \(userInput)")
                        return userInput
                    }
                } else {
                    print("Error! Invalid input.")
                    digitCount = 0 //reset digit count
                }
            }
        } else {
            print("Error! No Input.")
        }
    }
}

//test if char is digit
func isDigit(char: Character) -> Bool {
    switch char {
    case "0"..."9":
        return true
    default:
        return false
    }
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

//main
//print program header
print("Apple_HW5_LargeIntegers")
print("Type 'quit' to exit.\n")

while (true) {
    //set user input to variables and initialize 2D array components
    let userInput1 = validateInput(prompt: "LargeInt1: ")
    let userInput2 = validateInput(prompt: "LargeInt2: ")
    var tdArray: [[Int]] = []
    var row1: [Int] = []
    var row2: [Int] = []
    var row3: [Int] = []
    
    for e in userInput1 {
        row1.append(charToInt(tempChar: e))
    }
    for e in userInput2 {
        row2.append(charToInt(tempChar: e))
    }
    
    let maxColumns = max(row1.count, row2.count) //get size of largest row (number of digits)
    
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
    for i in 0..<(maxColumns + 1) {
        let sum = row1[i] + row2[i]
        row3.append(sum)
    }
    //carry over 10s place to previous element
    for i in (0..<maxColumns + 1).reversed() {
        if (row3[i] > 9) {
            row3[i-1] = (row3[i] / 10 % 10) + row3[i-1]
            row3[i] = row3[i] % 10
        } else {/*doNothing()*/}
    }
    
    //add 3rd row to array
    tdArray.append(row3)
  
    //display values to console
    print("\nLargeInt1:")
    for e in tdArray[0] {
        print("", e, separator: "", terminator: "")
    }
    
    print("\nLargeInt2:")
    for e in tdArray[1] {
        print("", e, separator: "", terminator: "")
    }
    
    print("\nLargeInt3:")
    for e in tdArray[2] {
        print("", e, separator: "", terminator: "")
    }
    print("\n")
}
