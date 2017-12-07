//
//  main.swift
//  Apple_HW5_LargeIntegers
//
//  Created by Reid Nolan on 12/7/17.
//  Copyright © 2017 Reid Nolan. All rights reserved.
//

import Foundation

//validate user input
func validateInput(prompt: String) -> String {
    while (true) {
        print(prompt)
        let userInput = readLine()!
        if(userInput.count > 0) {
            return userInput.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            print("Error! No Input.")
        }
    }
}

//main
//print program header
print("Apple_HW5_LargeIntegers")
print("Type 'quit' to exit.\n")

//variables for user input
var userInput1: String = ""
var userInput2: String = ""

//get 1st value
var userInput1Good = false
while (!userInput1Good) {
    let inStr1 = validateInput(prompt: "LargeInt1: ")
    if (inStr1 == "quit") {
        exit(3)
    } else if (Int(inStr1) != nil) {
        userInput1 = inStr1
        userInput1Good = true
    } else {
        print("Error! Invalid input.")
    }
}

//get 2nd value
var userInput2Good = false
while (!userInput2Good) {
    let inStr2 = validateInput(prompt: "LargeInt2: ")
    if (inStr2 == "quit") {
        exit(4)
    } else if (Int(inStr2) != nil) {
        userInput2 = inStr2
        userInput2Good = true
    } else {
        print("Error! Invalid input.")
    }
}

//set values of class objects
var largeInt1 = LargeInt(mInt: userInput1)
var largeInt2 = LargeInt(mInt: userInput2)

//display values of class objects
print("largeInt1 = [\(String(describing: largeInt1.mInt))]")
print("largeInt2 = [\(String(describing: largeInt2.mInt))]")
