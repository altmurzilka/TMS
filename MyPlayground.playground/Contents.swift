import UIKit

print(sumOfFour(number: "1234"))

func sumOfFour(number: String) -> Int {
    let digits = number.compactMap{ $0.wholeNumberValue }
    return number/1000 + number/100 + number/10
}
