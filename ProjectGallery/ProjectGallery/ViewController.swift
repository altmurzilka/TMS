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
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var rightImageView: UIImageView!
    
    @IBOutlet var rightViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var leftViewLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.image = UIImage(named: imageName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func pressLeft(_ sender: UIButton) {
        
        if self.itemIndex > 0 {
            self.itemIndex = self.itemIndex - 1
            myView.image = UIImage(named: contentImages[itemIndex])
            
            
        } else if self.itemIndex == 0 {
            self.itemIndex = contentImages.count - 1
            myView.image = UIImage(named: contentImages[itemIndex])
            
        }
    }
    
    @IBAction func pressRight(_ sender: UIButton) {
        
        if itemIndex + 1 < contentImages.count {
            self.itemIndex = self.itemIndex + 1
            rightImageView.image = UIImage(named: contentImages[itemIndex])
            rightAnimation()
            
        } else if self.itemIndex == contentImages.count - 1 {
            self.itemIndex = 0
            myView.image = UIImage(named: contentImages[itemIndex])
            
        }
    }
    
    func rightAnimation() {
        UIView.animate(withDuration: 1, animations: {
            self.rightImageView.frame.origin.x = self.myView.frame.origin.x
        }, completion: nil)
        
    }
    
    func viewToCopy() {
        UIView.animate(withDuration: 1, delay: 2, options: [], animations: {
            self.myView.image = UIImage(named: self.contentImages[self.itemIndex])
        }, completion: nil)
    }
}

