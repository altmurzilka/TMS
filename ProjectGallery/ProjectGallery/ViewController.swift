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
    
    var rightX: CGFloat = 0.0
    var leftX: CGFloat = 0.0
    
    @IBOutlet var myView: UIImageView!
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var rightImageView: UIImageView!
    
    @IBOutlet var rightViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var leftViewLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.dropShadow()
        myView.image = UIImage(named: imageName)
        rightX = rightImageView.frame.origin.x
        leftX = leftImageView.frame.origin.x
    }

    @IBAction func pressLeft(_ sender: UIButton) {
        viewFix()
        
        if self.itemIndex > 0 {
            self.itemIndex = self.itemIndex - 1
            leftImageView.image = UIImage(named: contentImages[itemIndex])
            leftAnimation()
            
        } else if self.itemIndex == 0 {
            self.itemIndex = contentImages.count - 1
            rightImageView.image = UIImage(named: contentImages[itemIndex])
            rightAnimation()
            
        }
    }
    
    @IBAction func pressRight(_ sender: UIButton) {
        viewFix()
        
        if itemIndex + 1 < contentImages.count {
            self.itemIndex = self.itemIndex + 1
            rightImageView.image = UIImage(named: contentImages[itemIndex])
            rightAnimation()
            
        } else if self.itemIndex == contentImages.count - 1 {
            self.itemIndex = 0
            leftImageView.image = UIImage(named: contentImages[itemIndex])
            leftAnimation()
            
        }
    }
    
    func rightAnimation() {
        UIView.animate(withDuration: 1, animations: {
            self.rightImageView.frame.origin.x = self.myView.frame.origin.x
        }, completion: { finish in
            if finish {
                self.viewToCopy()
                self.rightImageView.isHidden = true
            }
        })
    }
    
    func leftAnimation() {
        UIView.animate(withDuration: 1, animations: {
            self.leftImageView.frame.origin.x = self.myView.frame.origin.x
        }, completion: { finish in
            if finish {
                self.viewToCopy()
                self.leftImageView.isHidden = true
            }
        })
    }
    
    func viewToCopy() {
        UIView.animate(withDuration: 1, delay: 2, options: [], animations: {
            self.myView.image = UIImage(named: self.contentImages[self.itemIndex])
        }, completion: nil)
    }
    
    func viewFix() {
        rightImageView.frame.origin.x = rightX
        self.rightImageView.isHidden = false
        leftImageView.frame.origin.x = leftX
        self.leftImageView.isHidden = false
    }
}


extension UIImageView {
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
