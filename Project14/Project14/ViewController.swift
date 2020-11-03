//
//  ViewController.swift
//  Project14
//
//  Created by Алтын on 11/3/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doSmth { value in
            print("x = \(value)")
        }
        
    }

    @IBAction func buttonForward(_ sender: UIButton) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func doSmth(completion: @escaping (Int)->()) {
        var x  = 10
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            x = x*5
            completion(x)
        }
    }
    
}



//extension ViewController: SecondViewControllerDelagate {
//    func changeBgColor(_ text: String) {
//        myLabel.text = text
//    }
//}

