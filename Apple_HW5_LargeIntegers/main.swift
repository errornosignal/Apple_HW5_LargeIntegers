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
    let sum = (LargeInt(value: validateInput(prompt: "LargeInt1:"))) + (LargeInt(value: validateInput(prompt: "LargeInt2: ")))
    print("sum = \(sum)")
    
//    //subtract LargeInt objects and get difference (function is not complete in LargeInt class)
//    let difference = (LargeInt(value: validateInput(prompt: "LargeInt1: "))) + (LargeInt(value: validateInput(prompt: "LargeInt2: ")))
//    print("difference = \(difference)")
}
