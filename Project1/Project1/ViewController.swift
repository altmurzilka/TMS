import UIKit

class ViewController: UIViewController {
    
    var a = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(sumOf(numbers: array))
        self.firstW()
    }
    
    let array:[Double] = [2.5, 9.7, 6.9, 8.2]

    func sumOf(numbers: [Double]) -> (Int, String, String) {
        var total: Double = 0
        var integer : Double = 0
        var decimal : Double = 0

        for i in numbers {
            total += i
            integer += floor(i)
            decimal += i.truncatingRemainder(dividingBy: 1)
        }

        if (total.remainder(dividingBy: 2) == 0) {
            return (Int(integer), String(format: "%.01f", decimal), "number is even")
        }
        else {
            return (Int(integer), String(format: "%.01f", decimal), "number is odd")
        }
    }
    
    func firstW() {
        self.secondW()
        var a = 10
        a += a
        print(a)
        print(self.a)
        print("world")
    }
    
    func secondW() {
        self.thirdW()
        print("Hello")
    }
    
    func thirdW() {
        self.forthW()
        print("say")
    }
    
    func forthW() {
        print("I")
    }
}

