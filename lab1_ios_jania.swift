import Cocoa

let firstName: String = "Jania"
let lastName: String = "Utemuratova"
let age: Int = 19
let birthYear: Int = 2006
let isStudent: Bool = true
let height: Double = 169
let placeOfBirth: String = "Shymkent"
let currentYear: Int = 2025

let ageCalculated = currentYear - birthYear

var hobbies: [String] = ["Playing musical instruments", "Sewing", "Blogging"]
let numberOfHobbies: Int = 7
let favoriteNumber: Int = 7
let isHobbyCreative: Bool = true


let futureGoals: [String] = ["Become a good engeneer like my brothers", "Live a happy life", "Find my true love"]



let lifeStory = "My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear) in \(placeOfBirth). I am a student. I have \(numberOfHobbies) hobbies, and my favorite ones are: \(hobbies[0].lowercased()), \(hobbies[1].lowercased()), \(hobbies[2].lowercased()). \(hobbies[1]) is a creative hobby. My favorite number is \(favoriteNumber). In the future, I want to \(futureGoals[0]). \(futureGoals[2]) and \(futureGoals[1].lowercased())."

print(lifeStory)



