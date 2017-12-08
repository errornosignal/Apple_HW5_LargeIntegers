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
                    digitCount += 1
                    } else {/*doNothing()*/}
                }
                if (digitCount == userInput.count) {
                    if (Int(userInput) == 0) {
                        print("Error! Zero doesn't count.")
                        digitCount = 0
                    } else {
                        return userInput
                    }
                } else {
                    print("Error! Invalid input.")
                    digitCount = 0
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

//main
//print program header
print("Apple_HW5_LargeIntegers")
print("Type 'quit' to exit.\n")

//loop until user quits
while (true) {
    //add LargeInt objects and get sum
    let largeInt1 = LargeInt(value: validateInput(prompt: "LargeInt1:"))
    let largeInt2 = LargeInt(value: validateInput(prompt: "LargeInt2:"))
    var largeIntSum = LargeInt(value: "0")
    
    largeIntSum = largeInt1 + largeInt2
    //print("largeInt1 = \(largeInt1.value)")
    //print("largeInt2 = \(largeInt2.value)")
    print("largeIntSum = \(largeIntSum.value)")
    
//    //subtract LargeInt objects and get difference (function is not complete in LargeInt class)
//    let largeInt3 = LargeInt(value: validateInput(prompt: "LargeInt3:"))
//    let largeInt4 = LargeInt(value: validateInput(prompt: "LargeInt4:"))
//    var largeIntDifference = LargeInt(value: "0")
//
//    largeIntDifference = largeInt3 - largeInt4
//    print("largeInt3 = \(largeInt3.value)")
//    print("largeInt4 = \(largeInt4.value)")
//    print("largeIntDifference = \(largeIntDifference.value)")
    print()
}
