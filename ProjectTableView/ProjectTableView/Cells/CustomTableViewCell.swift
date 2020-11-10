//
//  CustomTableViewCell.swift
//  ProjectTableView
//
//  Created by Алтын on 11/10/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with text: Int) {
        self.myLabel.text = "\(text)"
    }
}
