// The Swift Programming Language
// https://docs.swift.org/swift-book

import Figlet
import ArgumentParser

@main
struct FigletTool : ParsableCommand {
    @Option(help: "Specify the input")
    public var input: String
    
    public func run() throws {
        for( i, char) in input.enumerated() {
            var first = String(repeating: "    ", count: i)
            let secound = String(char) + input.substring(to: input.index(input.startIndex, offsetBy: i))
            
            if(i > 0){
                first = input.substring(to: input.index(input.startIndex, offsetBy: i))
            }
            Figlet.say(first + secound)
        }
    }
}

func sumLetters(_ input: String) -> Int {
    var sum = 0
    for char in input {
        sum += Int(char.asciiValue!)
    }
    return sum
}
