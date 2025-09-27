import Cocoa
import Foundation


// Problem - 1
for number1 in 1...100 {
    if number1 % 3 == 0 && number1 % 5 == 0 {
        print("FizzBuzz")
    }
    else if number1 % 3 == 0 {
        print("Fizz")
    }
    else {
        print("Buzz")
    }
}


// Problem - 2
func isPrime(_ number: Int) -> Bool {
    if number < 2 {
            return false
        }
    var divisorCount = 0
        for i in 1...number {
            if number % i == 0 {
                divisorCount += 1
            }
        }
    return divisorCount == 2
}

for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}


//Problem - 3
func celsiusToFahrenheit(_ c: Double) -> Double {
    return (c * 9/5) + 32
}

func celsiusToKelvin(_ c: Double) -> Double {
    return c + 273.15
}

func fahrenheitToCelsius(_ f: Double) -> Double {
    return (f - 32) * 5/9
}

func fahrenheitToKelvin(_ f: Double) -> Double {
    return (f - 32) * 5/9 + 273.15
}

func kelvinToCelsius(_ k: Double) -> Double {
    return k - 273.15
}

func kelvinToFahrenheit(_ k: Double) -> Double {
    return (k - 273.15) * 9/5 + 32
}

print("Enter the temperature value: ", terminator: "")
if let tempInput = readLine(), let temperature = Double(tempInput) {
    print("Enter the unit (C, F, or K): ", terminator: "")
    if let unit = readLine()?.uppercased() {
        
        switch unit {
        case "C":
            let f = celsiusToFahrenheit(temperature)
            let k = celsiusToKelvin(temperature)
            print("\(temperature)°C = \(f)°F = \(k)K")
            
        case "F":
            let c = fahrenheitToCelsius(temperature)
            let k = fahrenheitToKelvin(temperature)
            print("\(temperature)°F = \(c)°C = \(k)K")
            
        case "K":
            let c = kelvinToCelsius(temperature)
            let f = kelvinToFahrenheit(temperature)
            print("\(temperature)K = \(c)°C = \(f)°F")
            
        default:
            print("Invalid unit! Please enter C, F, or K.")
        }
    }
} else {
    print("Invalid temperature input!")
}

//Problem - 4

var shoppingList: [String] = []

func displayMenu() {
    print("""
    
    ===== Shopping List Menu =====
    1. Add item
    2. Remove item
    3. View shopping list
    4. Exit
    ==============================
    """)
    print("Enter your choice: ", terminator: "")
}

@MainActor func addItem() {
    print("Enter item to add: ", terminator: "")
    if let item = readLine(), !item.isEmpty {
        shoppingList.append(item)
        print("'\(item)' added to the shopping list.")
    } else {
        print("Invalid input. Try again.")
    }
}

@MainActor func removeItem() {
    if shoppingList.isEmpty {
        print("Your shopping list is empty.")
        return
    }
    
    print("Enter the item to remove: ", terminator: "")
    if let item = readLine(), !item.isEmpty {
        if let index = shoppingList.firstIndex(of: item) {
            shoppingList.remove(at: index)
            print("'\(item)' removed from the shopping list.")
        } else {
            print("Item not found in the list.")
        }
    }
}

@MainActor func viewList() {
    if shoppingList.isEmpty {
        print("Your shopping list is empty.")
    } else {
        print("\nCurrent Shopping List:")
        for item in shoppingList{
            print(item)
        }
    }
}

// Main
var isRunning = true

while isRunning {
    displayMenu()
    if let choice = readLine() {
        switch choice {
        case "1":
            addItem()
        case "2":
            removeItem()
        case "3":
            viewList()
        case "4":
            print("Exiting the application.")
            isRunning = false
        default:
            print("Invalid choice. Please try again.")
        }
    }
}



////Problem - 5
import Foundation

func cleanWord(_ word: String) -> String {
    return word
        .lowercased()
        .trimmingCharacters(in: CharacterSet.punctuationCharacters)
}

print("Enter a sentence: ", terminator: "")
if let input = readLine() {
    
    let words = input.split(separator: " ").map { cleanWord(String($0)) }
    
    var wordFrequencies: [String: Int] = [:]
    
    for word in words where !word.isEmpty {
        wordFrequencies[word, default: 0] += 1
    }
    
    // Main
    print("\nWord Frequencies:")
    for (word, count) in wordFrequencies {
        print("\(word): \(count)")
    }
}


//Problem  - 6
func fibonacci(_ n: Int) -> Int {
    guard n >= 0 else {
        return 0
    }
    
    if n < 2 {
        return n
    }
    
    return fibonacci(n - 1) + fibonacci(n - 2)
}
print(fibonacci(10))


////Problem - 7

var students: [String: Int] = [:]

print("Enter the number of students: ", terminator: "")
if let input = readLine(), let count = Int(input), count > 0 {
    
    for i in 1...count {
        print("\nEnter name of student \(i): ", terminator: "")
        guard let name = readLine(), !name.isEmpty else {
            print("Invalid name.")
            continue
        }
        
        print("Enter score for \(name): ", terminator: "")
        if let scoreInput = readLine(), let score = Int(scoreInput) {
            students[name] = score
        } else {
            print("Invalid score.")
            students[name] = 0
        }
    }
    
    let scores = Array(students.values)
    
    let average = Double(scores.reduce(0, +)) / Double(scores.count)
    
    if let maxScore = scores.max(), let minScore = scores.min() {
        print("\nResults:")
        print("\nAverage Score: \(String(format: "%.2f", average))")
        print("\nHighest Score: \(maxScore)")
        print("\nLowest Score: \(minScore)")
        
        
           for (name, score) in students {
            let status = Double(score) >= average ? "Above Average" : "Below Average"
            print("\(name): \(score) (\(status))")
        }
    }
    
} else {
    print("⚠️ Invalid number of students.")
}


//Problem - 8
func isPaliindrome(_ input: String) -> Bool {
    let lowerCasedInput = input.lowercased()
    let reversedInput = String(lowerCasedInput.reversed())
    
    return lowerCasedInput == reversedInput
}

//Problem - 9
func addition(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func subtraction(_ a: Int, _ b: Int) -> Int {
    return a - b
}
func division(_ a: Int, _ b: Int) -> Int {
    return a / b
}
func multiplication(_ a: Int, _ b: Int) -> Int {
    return a * b
}
print("Enter first number: ", terminator: "")
if let s1 = readLine(), let n1 = Int(s1) {
    print("Enter second number: ", terminator: "")
    if let s2 = readLine(), let n2 = Int(s2) {
        print("Choose operation (+, -, *, /): ", terminator: "")
        if let op = readLine() {
            switch op {
            case "+": print("Result: \(addition(n1, n2))")
            case "-": print("Result: \(subtraction(n1, n2))")
            case "*": print("Result: \(multiplication(n1, n2))")
            case "/":
                if n2 != 0 {
                    print("Result: \(division(n1, n2))")
                } else {
                    print("⚠️ Division by zero not allowed")
                }
            default:
                print("⚠️ Invalid operation")
            }
        }
    }
}

//Problem - 10
func hasUniqueCharacters(_ text: String) -> Bool {
    var seen: Set<Character> = []
    
    for char in text {
        if seen.contains(char) {

            return false
        }
        seen.insert(char)
    }
    
    return true
}

