//
//  CustomView.swift
//  Project10
//
//  Created by Алтын on 10/22/20.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var button: UIButton!
    
    @IBAction func buttonAction(_ sender: UIButton) {
    }
    
    
    class func instanceFromNib() -> CustomView {
        return UINib(nibName: "CustomView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomView
    }
}
