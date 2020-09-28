import UIKit

class ViewController: UIViewController {
    
    var number = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.sum(a: 3, b: 5))
        self.sub(a: 3.4, b: 3)
        self.mul(a: 2, b: 3.5)
        self.div(a: 9.0, b: 1.5)
        
        print("Sum of numbers: \(sumOfFour(number: "1234"))")
        print(compareTwoStrings(stringOne: "aab", stringTwo: "áab"))
        //self.broken()
        print("\(number) to the power of 2 equals \(powersOfTwo(number: number))")
//        print("Factorial of \(number) equals \(factirial(number: number))")
    }
    
    // task 2
    func sumOfFour(number: String) -> Int {
        let digits = number.compactMap{ $0.wholeNumberValue }
        return digits.reduce(0, +)
    }
    
    // task 3
    func compareTwoStrings(stringOne: String, stringTwo: String) -> String {
        if stringOne > stringTwo {
            return "\(stringOne) greater than \(stringTwo)"
        }
        else if stringOne < stringTwo {
            return "\(stringOne) less than \(stringTwo)"
        } else {
            return "strings are equal"
        }
    }
    
    // task 4
    //    func broken() {
    //        print("Trying to break execution \(self.broken())")
    //    }
    
    // task 5
    func powersOfTwo(number: Int, power: Int = 2) -> Int {
        return Int(pow(Double(number), Double(power)))
    }
    
    // task 6
    func factirial(number: Int) -> Int {
        var counter = 1
        if number == 0 {
            return 1
        } else {
            for i in(1...number) {
                counter = counter * i
            }
            return counter
        }
    }
    
    // MARK: task 1
    
    // sum
    func sum(a: Int, b: Int) -> Int {
        return a+b
    }
    
    func sum(a: Double, b: Int) -> Double {
        return Double(round(10*(a+Double(b)))/10)
    }
    
    func sum(a: Int, b: Double) -> Int {
        return a+Int(b)
    }
    
    func sum(a: Double, b: Double) -> Double {
        return a+b
    }
    
    // sub
    func sub(a: Int, b: Int) {
        print(a-b)
    }
    
    func sub(a: Double, b: Int) {
        print(Double(round(10*(a-Double(b)))/10))
    }
    
    func sub(a: Int, b: Double) {
        print(a-Int(b))
    }
    
    func sub(a: Double, b: Double) {
        print(a-b)
    }
    
    // mul
    func mul(a: Int, b: Int) {
        print(a*b)
    }
    
    func mul(a: Double, b: Int) {
        print(Double(round(10*(a*Double(b)))/10))
    }
    
    func mul(a: Int, b: Double) {
        print(a*Int(b))
    }
    
    func mul(a: Double, b: Double) {
        print(a*b)
    }
    
    // div
    func div(a: Int, b: Int) {
        if b == 0 {
            print("Sick bastard!")
        } else {
            print(a/b)
        }
    }
    
    func div(a: Double, b: Int) {
        if b == 0 {
            print("Sick bastard!")
        } else {
            print(Double(round(10*(a/Double(b)))/10))
        }
    }
    
    func div(a: Int, b: Double) {
        if b == 0 {
            print("Sick bastard!")
        } else {
            print(a/Int(b))
        }
    }
    
    func div(a: Double, b: Double) {
        if b == 0 {
            print("Sick bastard!")
        } else {
            print(a/b)
        }
    }
    
}

