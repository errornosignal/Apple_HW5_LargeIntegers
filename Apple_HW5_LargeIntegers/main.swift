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
            return userInput
        } else {
            print("Error! No Input.")
        }
    }
}


//main
//print program header
print("Apple_HW5_LargeIntegers")
print("Type 'quit' to exit.\n")

var largeInt1: Int = 0
var largeInt2: Int = 0

//get 1st value
var userInput1Good = false; //boolean for loop
while (!userInput1Good) {
    let inStr1 = validateInput(prompt: "LargeInt1: ")
    let userInput1 = inStr1.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    //process selection
    if (userInput1 == "quit") {
        exit(3)
    } else if (Int(userInput1) != nil) {
        largeInt1 = Int(userInput1)!
        userInput1Good = true
        print("Yummy!")
    } else {
        print("Error! Invalid input.")
    }
}

//get 2nd value
var userInput2Good = false; //boolean for loop
while (!userInput2Good) {
    let inStr2 = validateInput(prompt: "LargeInt2: ")
    let userInput2 = inStr2.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    //process selection
    if (userInput2 == "quit") {
        exit(4)
    } else if (Int(userInput2) != nil) {
        largeInt1 = Int(userInput2)!
        userInput2Good = true
        print("Yummy Yummy!")
    } else {
        print("Error! Invalid input.")
    }
}
