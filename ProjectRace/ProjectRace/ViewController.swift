//
//  ViewController.swift
//  ProjectRace
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func NewGameButton(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "NewGameViewController") as! NewGameViewController
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func RecordsButton(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RecordsViewController") as! RecordsViewController
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func Settings(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        self.present(controller, animated: true, completion: nil)
    }
    
}

