//
//  ViewController.swift
//  ProjectGallery
//
//  Created by Алтын on 10/4/20.
//

import UIKit

class ViewController: UIViewController {
    
    let contentImages = ["flutter", "macos", "nlapi", "swiftui"]
    
    var itemIndex: Int = 0
    var imageName: String = "flutter" {
        didSet {
            if let imageView = myView {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    @IBOutlet var myView: UIImageView!
    @IBOutlet var myViewLeft: UIImageView!
    @IBOutlet var myViewRight: UIImageView!
    
    @IBOutlet var rightViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var leftViewLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.image = UIImage(named: imageName)
    }
    
    @IBAction func pressLeft(_ sender: UIButton) {
        
        if self.itemIndex > 0 {
            self.itemIndex = self.itemIndex - 1
            myViewLeft.image = UIImage(named: contentImages[itemIndex])
            
            moveLeft()
            
        } else if self.itemIndex == 0 {
            self.itemIndex = contentImages.count - 1
            myView.image = UIImage(named: contentImages[itemIndex])
            
        }
    }
    
    @IBAction func pressRight(_ sender: UIButton) {
        
        if itemIndex + 1 < contentImages.count {
            self.itemIndex = self.itemIndex + 1
            myView.image = UIImage(named: contentImages[itemIndex])
            
        } else if self.itemIndex == contentImages.count - 1 {
            self.itemIndex = 0
            myView.image = UIImage(named: contentImages[itemIndex])
            
        }
    }
    
    func moveLeft() {
        rightViewTrailingConstraint.constant += myViewLeft.frame.size.width
        
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
          self.view.layoutIfNeeded()
        }, completion: { finished in
          print("Basket doors opened!")
        })
    }
    
    
}

