//
//  NewGameViewController.swift
//  ProjectRace
//
//  Created by Алтын on 9/24/20.
//

import UIKit

class NewGameViewController: UIViewController {
    
    @IBOutlet var supportingRoadView: UIImageView!
    @IBOutlet var roadView: UIImageView!
    @IBOutlet var carImage: UIImageView!
    
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        roadMove()
    }
    
    func roadMove() {
        UIView.animate(withDuration: 2, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            self.roadView.frame = self.roadView.frame.offsetBy(dx: 0.0, dy: self.roadView.frame.size.height)
            self.supportingRoadView.frame = self.supportingRoadView.frame.offsetBy(dx: 0.0, dy: self.supportingRoadView.frame.size.height)
        }, completion: nil)
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        self.carImage.bounds.origin.x -= 30
        leftButton.showsTouchWhenHighlighted = true
    }
    @IBAction func tapRight(_ sender: UIButton) {
        self.carImage.bounds.origin.x += 30
        rightButton.showsTouchWhenHighlighted = true
    }
}
