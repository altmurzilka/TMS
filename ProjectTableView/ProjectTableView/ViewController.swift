//
//  ViewController.swift
//  ProjectTableView
//
//  Created by Алтын on 11/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var array = [1, 2, 3, 4, 5, 6, 7, 8]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let lastValue = array.last else { return }
        array.append(lastValue + 1)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as?  CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: array[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

