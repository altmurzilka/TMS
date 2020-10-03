//
//  ItemViewController.swift
//  ProjectImageSlider
//
//  Created by Алтын on 10/3/20.
//

import UIKit

class ItemViewController: UIViewController {
    
    var itemIndex: Int = 0
    var imageName: String = "" {
        didSet {
            if let imageView = contentImageView {
                imageView.image = UIImage(named: imageName)
            }
        }
    }

    @IBOutlet var contentImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentImageView.image = UIImage(named: imageName)
    }

}
