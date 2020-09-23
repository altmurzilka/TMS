//
//  SecondViewController.swift
//  Project5
//
//  Created by Алтын on 9/22/20.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private var textLabel: UILabel!
    
    var text = "" 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textLabel.text = text
    }
    

    @IBAction func SecondViewButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
