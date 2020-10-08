//
//  NewGameViewController.swift
//  ProjectRace
//
//  Created by Алтын on 9/24/20.
//

import UIKit


class NewGameViewController: UIViewController {

    let myImageView = UIImageView()

    @IBOutlet var supportingRoadView: UIImageView!
    @IBOutlet var roadView: UIImageView!
    @IBOutlet var carImage: UIImageView!

    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!

    let contentImages = ["boy", "girl", "ball", "log"]
    var imagesView = [UIImageView]()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        obstacleView()
        roadMove()
    }


    func roadMove() {
        UIView.animate(withDuration: 7, delay: 3.0, options: [.repeat, .curveLinear], animations: {
            self.roadView.frame = self.roadView.frame.offsetBy(dx: 0.0, dy: self.roadView.frame.size.height)
            self.supportingRoadView.frame = self.supportingRoadView.frame.offsetBy(dx: 0.0, dy: self.supportingRoadView.frame.size.height)
        }, completion: nil)

    }

    func obstacleView() {
        myImageView.frame = CGRect(x: CGFloat.random(in: 25...(view.frame.size.width - 25)), y: 0.0, width: 50, height: 50)
        myImageView.contentMode = .scaleToFill
        myImageView.image = UIImage(named: contentImages.randomElement()!)
        self.view.addSubview(myImageView)
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

