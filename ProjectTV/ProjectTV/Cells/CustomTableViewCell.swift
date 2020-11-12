//
//  CustomTableViewCell.swift
//  ProjectTV
//
//  Created by Алтын on 11/12/20.
//

import UIKit

protocol TableViewNew {
    func onClickCell(color: UIColor)
}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myButton: UIButton!
    
    var cellDelegate: TableViewNew?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        cellDelegate?.onClickCell(color: button.)
        cellDelegate?
    }
    
    func setButton(button: ColorButton) {
        myButton.setTitle(button.label, for:.normal)
    }
}
