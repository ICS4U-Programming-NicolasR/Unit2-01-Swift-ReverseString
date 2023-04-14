import Foundation

/**
 * Reads a file and reverses each line.
 */

// Define a function to reverse a string
func reverseString(_ str: String) -> String {
    if str.isEmpty {
        return str
    }
    return String(str.last!) + reverseString(String(str.dropLast()))
}

// Define input and output file paths
let inputFilePath = "input.txt"
let outputFilePath = "output.txt"

// Read input from file
if let inputString = try? String(contentsOfFile: inputFilePath) {
    // Separate the input into lines
    let inputLines = inputString.components(separatedBy: .newlines)
    
    // Reverse each line
    var reversedLines = [String]()
    for line in inputLines {
        reversedLines.append(reverseString(line))
    }
    
    // Write output to file
    let outputString = "Reversed lines: \n" + reversedLines.joined(separator: "\n")
    do {
        try outputString.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
    } catch {
        print("Error writing to file: \(error)")
    }
} else {
    print("Error reading input file.")
}
