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
    
    let contentImages = ["boy", "girl", "ball", "log"]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        roadMove()
        print(view.frame.size.width)
        
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>));
        imageView.image = UIImage(named:"image.jpg")
        self.view.addSubview(imageView)
    }
    
    func roadMove() {
        UIView.animate(withDuration: 2, delay: 0.0, options: [.repeat, .curveLinear], animations: {
            self.roadView.frame = self.roadView.frame.offsetBy(dx: 0.0, dy: self.roadView.frame.size.height)
            self.supportingRoadView.frame = self.supportingRoadView.frame.offsetBy(dx: 0.0, dy: self.supportingRoadView.frame.size.height)
        }, completion: nil)
    }
    
    @IBAction func tapLeft(_ sender: UIButton) {
        if self.carImage.frame.origin.x <= 25 {
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            self.carImage.frame.origin.x -= 30
            leftButton.showsTouchWhenHighlighted = true
        }
    }
    @IBAction func tapRight(_ sender: UIButton) {
        if self.carImage.frame.maxX >= view.frame.size.width - 25 {
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            self.carImage.frame.origin.x += 30
            rightButton.showsTouchWhenHighlighted = true
        }
    }
}
