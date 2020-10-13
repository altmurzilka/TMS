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
    
    var obstacleImageView = UIImageView()
    
    override func viewDidLoad() {
        obstacleView()
    }
    
    var contentImages = ["boy", "girl", "ball", "log"]
    
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
    
    func obstacleView() {
        imageViewGenerator()
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
    
    func imageViewGenerator() {
        let displayLink = CADisplayLink(target: self, selector: #selector(self.fireTimer))
        displayLink.add(to: .current, forMode: .common)
        contentImages.shuffle()
        self.obstacleImageView.image = UIImage(named: self.contentImages[0])
        obstacleImageView.frame = CGRect(x: CGFloat.random(in: 25...(self.view.frame.width - 125)), y: -100, width: 70, height: 70)
        view.addSubview(obstacleImageView)
        
        UIView.animate(withDuration: 3, delay: 1.0, options: [.repeat, .curveLinear], animations: {
            self.obstacleImageView.frame = self.obstacleImageView.frame.offsetBy(dx: 0.0, dy: self.view.frame.size.height + 100)
        }, completion: nil)
    }
    
    @objc func fireTimer() {
        if self.carImage.layer.presentation()!.frame.intersects(self.obstacleImageView.layer.presentation()!.frame) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}


