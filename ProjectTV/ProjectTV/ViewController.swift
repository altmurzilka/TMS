//
//  ViewController.swift
//  ProjectTV
//
//  Created by Алтын on 11/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var buttons: [ColorButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = createArray()
    }
    
    func createArray() -> [ColorButton] {
        var buttonData: [ColorButton] = []
        
        let button1 = ColorButton(label: "red", color: UIColor.red)
        let button2 = ColorButton(label: "blue", color: UIColor.blue)
        let button3 = ColorButton(label: "brown", color: UIColor.brown)
        let button4 = ColorButton(label: "cyan", color: UIColor.cyan)
        let button5 = ColorButton(label: "gray", color: UIColor.gray)
        let button6 = ColorButton(label: "green", color: UIColor.green)
        let button7 = ColorButton(label: "magenta", color: UIColor.magenta)
        let button8 = ColorButton(label: "orange", color: UIColor.orange)
        let button9 = ColorButton(label: "purple", color: UIColor.purple)
        let button10 = ColorButton(label: "yellow", color: UIColor.yellow)
        let button11 = ColorButton(label: "indogo", color: UIColor.systemIndigo)
        let button12 = ColorButton(label: "pink", color: UIColor.systemPink)
        
        buttonData.append(button1)
        buttonData.append(button2)
        buttonData.append(button3)
        buttonData.append(button4)
        buttonData.append(button5)
        buttonData.append(button6)
        buttonData.append(button7)
        buttonData.append(button8)
        buttonData.append(button9)
        buttonData.append(button10)
        buttonData.append(button11)
        buttonData.append(button12)
        
        return buttonData
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let button = buttons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as!  CustomTableViewCell
        
        cell.setButton(button: button)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSelectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSelectionAt section: Int) -> CGFloat {
        return 10
    }
    
}


