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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myView.image = UIImage(named: imageName)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
            myView.image = UIImage(named: contentImages[itemIndex])
            
        } else if self.itemIndex == contentImages.count - 1 {
            self.itemIndex = 0
            myView.image = UIImage(named: contentImages[itemIndex])
            
        }
    }
    
    
}

