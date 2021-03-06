//
//  ViewController.swift
//  ProjectCustomClass
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class ViewController: UIViewController {
    
    let pancake = Pancake(name: "MelonPancake", filling: "melon", topping: "strawberry")

    @IBAction func buttonTapped(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        controller.name = pancake.name
        controller.filling = pancake.filling
        controller.topping = pancake.topping
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

